# EVM Internals: Memory, Storage & Opcodes

**Last verified: 2026-01**

> **Purpose**: Deep dive into EVM execution, memory management, storage layout, and opcode-level optimization. This guide covers the low-level mechanics that drive gas costs and enable advanced optimization techniques.

---

## Quick Navigation

- [Memory Layout & Management](#memory-layout--management)
- [Storage Architecture](#storage-architecture)
- [Opcode Reference & Costs](#opcode-reference--costs)
- [Gas Cost Breakdown](#gas-cost-breakdown)
- [Optimization Techniques](#optimization-techniques)
- [EVM Limits & Technical Constraints](#evm-limits--technical-constraints)

---

## Core Resources

- [Solidity Internals: Layout in memory](https://docs.soliditylang.org/en/latest/internals/layout_in_memory.html)   
- [Solidity Internals: Layout in storage](https://docs.soliditylang.org/en/latest/internals/layout_in_storage.html)
- [Solidity Contract Layout Guide](https://github.com/Cyfrin/foundry-full-course-f23#solidity-contract-layout) - best practices for organizing Solidity code
- [Solidity Optimizer](https://docs.soliditylang.org/en/latest/internals/optimizer.html) - IR-based (`via_ir`) optimizer recommended for modern contracts
- [EVM Opcodes Reference](https://ethereum.org/en/developers/docs/evm/opcodes/) - official docs | [evm.codes](https://www.evm.codes/) - interactive playground   
- [4byte signature DB](https://www.4byte.directory/) or [OpenChain](https://openchain.xyz/signatures)   
- [EVM Storage Explorer](https://evm.storage/) - visualize storage layout   

## Gas-Optimized Libraries

- [Solady](https://github.com/Vectorized/solady) - highly optimized Solidity library with assembly
- [Solmate](https://github.com/transmissions11/solmate) - gas-optimized building blocks

## Learning Resources

- Patrick Collins [storage walkthrough](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=42469) - [FunWithStorage contract](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=42690)      
- [Brief storage video](https://youtu.be/_YkulBTqIcQ?t=522)    
- [Storage vs Memory explained](https://soliditytips.com/articles/solidity-data-location-storage-memory/)   
- [Gas-optimization course](https://www.udemy.com/course/advanced-solidity-understanding-and-optimizing-gas-costs/?referralCode=C4684D6872713525E349) by Jeffrey Scholz ([RareSkills](https://github.com/RareSkills))   
- Foundry Debugger [tutorial](https://youtu.be/sas02qSFZ74?list=PL4Rj_WH6yLgWe7TxankiqkrkVKXIwOP42&t=25270)   

[Play with opcodes](https://www.evm.codes/playground)      

## Recent Opcode Additions

- `PUSH0` - push constant 0 onto stack (Shanghai, April 2023, EIP-3855) - saves gas vs `PUSH1 0`
- `TSTORE`/`TLOAD` - transient storage opcodes (Dencun, March 2024, EIP-1153)
- `MCOPY` - efficient memory copying opcode (Dencun, March 2024, EIP-5656)
- `BLOBHASH` - blob hash opcode for EIP-4844 blob data (Dencun, March 2024)
- `CLZ` - count leading zeros (Fusaka, Dec 2025, EIP-7939)
- BLS12-381 precompile addresses (Pectra, May 2025, EIP-2537)
- secp256r1/P-256 precompile (Fusaka, Dec 2025, EIP-7951)

## EVM Limits & Constants

[Block](https://ethereum.org/en/developers/docs/blocks/) gas limit: 30M (pre-Fusaka), 60M (Fusaka EIP-7935, Dec 2025). New block every ~12 seconds; memory explosion due to quadratic growth   
- `Max transaction gas limit` - individual transaction gas cap: 16.7M (Fusaka EIP-7825, Dec 2025), preventing single transactions from consuming excessive block space   
- `BaseFee` - is burned; determined by network; Solidity can access via `block.basefee`   
- `Max Fee` - most willing to pay; upper bound of gas price   
- `Max priority fee` - most you are willing to give to the validator (block proposer)   
- `Priority fee` - most willing to give to validator out of what's left when max fee is subtracted from basefee, aka validator tip   
- `cold access` vs `warm access` - cold access (2100 gas) the first time you read a storage slot or call a contract in a transaction; warm access (100 gas) for subsequent reads/calls in the same transaction. Introduced in EIP-2929 (Berlin, April 2021)  

---

## Memory Layout & Management

### EVM Memory Structure

The EVM memory is a linear, byte-addressable space that expands dynamically. Understanding its layout is crucial for gas optimization.

#### Reserved Memory Regions

| Address Range | Purpose | Notes |
|---------------|---------|-------|
| `0x00 - 0x1F` | Scratch space (32 bytes) | Used for hashing methods, temporary calculations |
| `0x20 - 0x3F` | Scratch space (32 bytes) | Used for hashing methods, temporary calculations |
| `0x40 - 0x5F` | **Free memory pointer** | Points to next available memory location |
| `0x60 - 0x7F` | Zero slot (32 bytes) | Reserved for empty dynamic memory arrays |
| `0x80+` | Free memory | User-allocated memory begins here |

#### Free Memory Pointer (0x40)

- **Purpose**: Points to the start of unallocated memory
- **Initial value**: `0x80` (128 bytes)
- **Usage**: `mload(0x40)` retrieves current free memory pointer
- **Update**: When allocating memory, increment pointer to reserve space
- **Critical**: Always update after allocating memory to prevent overwrites

**Example:**
```solidity
// Reading free memory pointer in assembly
assembly {
    let freeMemPtr := mload(0x40)  // Read current free memory location
    // Allocate 64 bytes
    mstore(0x40, add(freeMemPtr, 0x40))  // Update pointer
}
```

#### Memory Expansion Cost

Memory grows in 32-byte words. Cost is **quadratic**:
- Formula: `memory_cost = (memory_size_word)² / 512 + (3 × memory_size_word)`
- First **724 bytes** are relatively cheap (~3 gas per word)
- After ~724 bytes, costs increase quadratically
- **Impact**: Large memory allocations in loops are extremely expensive

**Gas Cost Examples:**
- 0-32 bytes: 3 gas
- 32-64 bytes: 6 gas
- 64-96 bytes: 9 gas
- 10KB: ~500 gas
- 100KB: ~50,000 gas
- 1MB: ~5,000,000 gas

#### Memory vs Storage vs Calldata vs Stack

| Location | Gas Cost | Persistence | Size Limit | Use Case |
|----------|----------|-------------|------------|----------|
| **Stack** | Free (3 gas) | Transaction only | 1024 items | Local variables, computation |
| **Memory** | 3 gas + quadratic | Transaction only | Unlimited* | Function arguments, dynamic arrays |
| **Storage** | 20,000 gas (cold SSTORE) | Permanent | 2²⁵⁶ slots | Contract state variables |
| **Calldata** | 4 gas (zero) / 16 gas (non-zero) | Transaction only | Block gas limit | External function parameters |

*Unlimited but practically constrained by quadratic gas cost

#### Memory Optimization Strategies

1. **Reuse scratch space** for temporary calculations
2. **Use calldata** for read-only external function parameters
3. **Minimize memory arrays** in loops
4. **Pack data efficiently** to reduce memory footprint
5. **Avoid unnecessary copying** between memory locations

---

## Storage Architecture

### Storage Layout

Storage is a key-value store with 2²⁵⁶ slots, each 32 bytes (256 bits).

#### Storage Slot Packing

Multiple variables <32 bytes can share a single slot:

```solidity
// Bad - uses 3 storage slots
uint256 a;  // Slot 0
uint128 b;  // Slot 1
uint128 c;  // Slot 2

// Good - uses 2 storage slots
uint256 a;  // Slot 0
uint128 b;  // Slot 1 (first 16 bytes)
uint128 c;  // Slot 1 (last 16 bytes)

// Best - uses 1 storage slot
uint64 a;   // Slot 0 (bytes 0-7)
uint64 b;   // Slot 0 (bytes 8-15)
uint64 c;   // Slot 0 (bytes 16-23)
uint64 d;   // Slot 0 (bytes 24-31)
```

**Gas savings**: Each avoided slot saves **20,000 gas** on first write (cold SSTORE).

#### Storage Location for Complex Types

**Mappings:**
- Slot determined by: `keccak256(abi.encodePacked(key, slot))`
- Each key gets unique storage location
- No length stored (unbounded)

**Dynamic Arrays:**
- Length stored at base slot
- Elements start at: `keccak256(abi.encodePacked(slot))`
- Element `i` at: `keccak256(slot) + i`

**Structs:**
- Members occupy consecutive slots
- Follow same packing rules as variables

**Fixed Arrays:**
- Elements stored in consecutive slots
- No separate length storage

#### Storage Offset

- **Offset**: Position within a 32-byte slot where data begins
- **Example**: In a slot with two `uint128` values:
  - First uint128: offset 0 (bytes 0-15)
  - Second uint128: offset 16 (bytes 16-31)

### Data Type Sizes

|   Type  | address | bool | uint8 | uint16 | uint32 | uint64 | uint128 | uint256 | bytes1 | bytes32 |
|---------|---------|------|-------|--------|--------|--------|---------|---------|--------|---------|
| Bytes   | 20      | 1    | 1     | 2      | 4      | 8      | 16      | 32      | 1      | 32      |

**Implications:**
- Types <32 bytes need masking/shifting to extract from storage slots
- Accessing packed values costs extra gas (SLOAD + bit operations)
- Trade-off: storage savings vs computational overhead

---

## Opcode Reference & Costs

### Stack Operations (0-3 gas)

| Opcode | Gas | Description | Stack Effect |
|--------|-----|-------------|--------------|
| `PUSH0` | 2 | Push 0 onto stack (Shanghai+) | → 0 |
| `PUSH1-PUSH32` | 3 | Push 1-32 bytes onto stack | → value |
| `POP` | 2 | Remove item from stack | value → |
| `DUP1-DUP16` | 3 | Duplicate stack item | ..., a → ..., a, a |
| `SWAP1-SWAP16` | 3 | Swap top with nth item | ..., a, b → ..., b, a |

### Arithmetic & Logic (3-5 gas)

| Opcode | Gas | Description | Notes |
|--------|-----|-------------|-------|
| `ADD` | 3 | Addition | a + b |
| `SUB` | 3 | Subtraction | a - b |
| `MUL` | 5 | Multiplication | a × b |
| `DIV` | 5 | Division | a / b (integer) |
| `MOD` | 5 | Modulo | a % b |
| `ADDMOD` | 8 | (a + b) % N | Prevents overflow |
| `MULMOD` | 8 | (a × b) % N | Prevents overflow |
| `EXP` | 10* | Exponentiation | a ** b (*+50 gas per byte in exponent) |
| `LT` | 3 | Less than | a < b |
| `GT` | 3 | Greater than | a > b |
| `EQ` | 3 | Equality | a == b |
| `ISZERO` | 3 | Is zero check | a == 0 |
| `AND` | 3 | Bitwise AND | a & b |
| `OR` | 3 | Bitwise OR | a \| b |
| `XOR` | 3 | Bitwise XOR | a ^ b |
| `NOT` | 3 | Bitwise NOT | ~a |
| `SHL` | 3 | Shift left | a << b |
| `SHR` | 3 | Shift right | a >> b |
| `SAR` | 3 | Arithmetic shift right | Preserves sign bit |

### Memory Operations (3-12 gas + expansion)

| Opcode | Gas | Description | Notes |
|--------|-----|-------------|-------|
| `MLOAD` | 3* | Load word from memory | *+ memory expansion |
| `MSTORE` | 3* | Store word to memory | *+ memory expansion |
| `MSTORE8` | 3* | Store byte to memory | *+ memory expansion |
| `MSIZE` | 2 | Get size of active memory | In bytes |
| `MCOPY` | 3* | Copy memory (Dencun+) | *+ word_cost + expansion |

### Storage Operations (100-20,000 gas)

| Opcode | Gas | Description | Notes |
|--------|-----|-------------|-------|
| `SLOAD` | 2,100 (cold) | Load from storage | 100 gas if warm |
| `SSTORE` | 20,000 (cold, zero→non-zero) | Store to storage | 5,000 gas if warm |
| `SSTORE` | 5,000 | Modify existing value | |
| `SSTORE` | 5,000 (non-zero→zero) | Delete (with refund) | 15,000 gas refund (max 20% tx gas) |
| `TLOAD` | 100 | Load from transient storage (Dencun+) | Cleared after tx |
| `TSTORE` | 100 | Store to transient storage (Dencun+) | No persistence |

**Cold vs Warm Access (EIP-2929, Berlin):**
- **Cold**: First access in transaction (expensive)
- **Warm**: Subsequent accesses (cheap)
- Applies to storage slots and external contract calls

### Call Operations (100-25,000 gas)

| Opcode | Gas | Description | Notes |
|--------|-----|-------------|-------|
| `CALL` | 100* | Call external contract | *+2,600 if cold, +9,000 if value transfer |
| `STATICCALL` | 100* | Static call (no state change) | *+2,600 if cold |
| `DELEGATECALL` | 100* | Call with caller's context | *+2,600 if cold |
| `CALLCODE` | 100* | Deprecated, use DELEGATECALL | |
| `CREATE` | 32,000 | Deploy new contract | + deployment code cost |
| `CREATE2` | 32,000 | Deploy with deterministic address | + deployment code cost + hashing |

### Hashing & Cryptography

| Opcode | Gas | Description | Cost Formula |
|--------|-----|-------------|--------------|
| `KECCAK256` | 30 | Keccak-256 hash | 30 + 6 per word |
| `SHA3` | 30 | Alias for KECCAK256 | Same as KECCAK256 |

### Block & Transaction Info (2 gas)

| Opcode | Gas | Description | Returns |
|--------|-----|-------------|---------|
| `BLOCKHASH` | 20 | Get recent block hash | Hash of block (last 256 blocks) |
| `COINBASE` | 2 | Get block proposer address | Current validator address |
| `TIMESTAMP` | 2 | Get block timestamp | Unix timestamp |
| `NUMBER` | 2 | Get block number | Current block number |
| `DIFFICULTY` | 2 | Get difficulty/PREVRANDAO | PREVRANDAO in PoS |
| `GASLIMIT` | 2 | Get block gas limit | Current block gas limit |
| `CHAINID` | 2 | Get chain ID | 1 (mainnet), 11155111 (Sepolia) |
| `BASEFEE` | 2 | Get base fee | EIP-1559 base fee |
| `BLOBHASH` | 3 | Get blob hash (Dencun+) | EIP-4844 blob hash |

### Log Operations (375 gas + data)

| Opcode | Gas | Description | Formula |
|--------|-----|-------------|---------|
| `LOG0` | 375 | Emit log (no topics) | 375 + 8 per byte |
| `LOG1` | 375 | Emit log (1 topic) | 375 + 375 + 8 per byte |
| `LOG2` | 375 | Emit log (2 topics) | 375 + 750 + 8 per byte |
| `LOG3` | 375 | Emit log (3 topics) | 375 + 1125 + 8 per byte |
| `LOG4` | 375 | Emit log (4 topics) | 375 + 1500 + 8 per byte |

**Cost breakdown**: Base (375) + 375 per topic + 8 gas per data byte

### Control Flow (0-10 gas)

| Opcode | Gas | Description | Notes |
|--------|-----|-------------|-------|
| `JUMP` | 8 | Unconditional jump | To valid JUMPDEST |
| `JUMPI` | 10 | Conditional jump | Only if condition true |
| `JUMPDEST` | 1 | Jump destination marker | Valid jump target |
| `PC` | 2 | Get program counter | Current instruction position |
| `STOP` | 0 | Halt execution | End without return |
| `RETURN` | 0* | Return data | *+ memory expansion |
| `REVERT` | 0* | Revert state | *+ memory expansion |
| `INVALID` | All gas | Invalid opcode | Consumes all gas |
| `SELFDESTRUCT` | 5,000 | Destroy contract | + 25,000 if sending ETH |

---

## Optimization Techniques

### Bit Manipulation

**Bit Masking** - Extract or clear specific bits:
```solidity
// Extract lower 128 bits
uint256 value = 0x123456789ABCDEF0123456789ABCDEF0;
uint128 lower = uint128(value);  // Mask: 0x00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF

// Extract upper 128 bits
uint128 upper = uint128(value >> 128);

// Set specific bits
uint256 mask = 0xFF;  // Keep only last 8 bits
uint256 result = value & mask;
```

**Bit Shifting** - Efficient multiplication/division:
```solidity
// Multiply by 2^n using left shift (<<)
uint256 a = 5;
uint256 b = a << 2;  // 5 * 2^2 = 20 (cheaper than a * 4)

// Divide by 2^n using right shift (>>)
uint256 c = 20;
uint256 d = c >> 2;  // 20 / 2^2 = 5 (cheaper than c / 4)
```

**Gas savings**: Bit shifting saves ~2-3 gas compared to MUL/DIV for powers of 2.

### Short Circuiting

Order conditional expressions for early exit:
```solidity
// Good - cheap check first
if (cheapCheck && expensiveCheck) { ... }

// Bad - expensive check always runs
if (expensiveCheck && cheapCheck) { ... }

// Best - use nested ifs for clarity
if (cheapCheck) {
    if (expensiveCheck) { ... }
}
```

### Assembly Optimization

Direct memory manipulation:
```solidity
// Solidity - more expensive
function getSlot(uint256 slot) public view returns (uint256 value) {
    assembly {
        value := sload(slot)
    }
}

// Assembly - cheaper
function getSlotAsm(uint256 slot) public view returns (uint256 value) {
    assembly {
        value := sload(slot)
        // Skip Solidity's memory safety checks
    }
}
```     

---

## Gas Cost Breakdown

### Transaction Costs (Current as of 2026)

**Base transaction cost**: 21,000 gas (intrinsic gas - paid for any transaction)

**Calldata cost** (transaction input data):
- Non-zero byte: **16 gas**
- Zero byte: **4 gas**
- **Optimization tip**: Use more zero bytes when possible (e.g., 0x0000 cheaper than 0xFFFF)

**Example calldata costs:**
```solidity
// Function: transfer(address,uint256)
// Selector: 0xa9059cbb (4 bytes) = 4 * 16 = 64 gas
// Address: 0x0000...1234 (20 bytes, assume 18 zeros) = 18*4 + 2*16 = 104 gas
// Amount: 0x0000...0064 (32 bytes, assume 30 zeros) = 30*4 + 2*16 = 152 gas
// Total calldata: 64 + 104 + 152 = 320 gas
```

### Storage Costs (Most Expensive)

| Operation | Cold (First Access) | Warm (Subsequent) | Notes |
|-----------|-------------------|------------------|-------|
| **SLOAD** | 2,100 gas | 100 gas | Read from storage |
| **SSTORE** (zero → non-zero) | 20,000 gas | N/A | Most expensive write |
| **SSTORE** (non-zero → different) | 5,000 gas | 5,000 gas | Modify existing value |
| **SSTORE** (non-zero → zero) | 5,000 gas | 5,000 gas | + 15,000 refund* |
| **SSTORE** (no change) | 2,100 gas | 100 gas | Same as SLOAD |

***Gas refunds**: Capped at 20% of total transaction gas used (EIP-3529, London fork)

**Cost comparison**:
- Storage write (cold): **20,000 gas** (~$40 at 50 gwei, $3000 ETH)
- Memory write: **3 gas** + expansion
- Stack operation: **3 gas**

### Memory Costs (Quadratic Growth)

Formula: `memory_cost = (memory_size_word)² / 512 + (3 × memory_size_word)`

| Memory Size | Approximate Cost | Use Case |
|------------|------------------|----------|
| 0-32 bytes | ~3 gas | Single value |
| 0-224 bytes | ~21 gas | Small struct |
| 0-724 bytes | ~57 gas | "Free" zone threshold |
| 1 KB | ~180 gas | Small array |
| 10 KB | ~5,000 gas | Medium array |
| 100 KB | ~500,000 gas | Large array (avoid!) |

**Key insight**: Memory costs are negligible for small amounts (<1KB) but explode for large allocations.

### Computation Costs (Cheap)

| Category | Opcodes | Gas Cost | Examples |
|----------|---------|----------|----------|
| **Stack** | PUSH, POP, DUP, SWAP | 2-3 gas | Variable access |
| **Arithmetic** | ADD, SUB, MUL, DIV | 3-5 gas | Math operations |
| **Logic** | AND, OR, XOR, NOT | 3 gas | Bit operations |
| **Comparison** | LT, GT, EQ, ISZERO | 3 gas | Conditionals |
| **Shifts** | SHL, SHR, SAR | 3 gas | Bit shifting |
| **Hashing** | KECCAK256 | 30 + 6/word | Cryptographic hash |

### External Call Costs

| Operation | Base Gas | Additional | Total (Typical) |
|-----------|----------|------------|-----------------|
| **CALL** (warm) | 100 gas | +2,600 (cold) | 2,700 gas (cold) |
| **CALL** (with value) | 100 gas | +9,000 | 9,100 gas |
| **STATICCALL** (warm) | 100 gas | +2,600 (cold) | 2,700 gas (cold) |
| **DELEGATECALL** (warm) | 100 gas | +2,600 (cold) | 2,700 gas (cold) |
| **CREATE** | 32,000 gas | +deploy cost | 100,000+ gas |
| **CREATE2** | 32,000 gas | +deploy cost | 100,000+ gas |

### Contract Deployment Costs

- **Base CREATE cost**: 32,000 gas
- **Per byte of code**: 200 gas (runtime bytecode)
- **Initialization code**: Actual gas used during execution
- **Typical deployment**: 100,000 - 1,000,000 gas depending on contract size

**Example**: Deploying a 10KB contract
```
32,000 (CREATE) + 10,240 bytes × 200 gas = ~2,080,000 gas total
```

---

## Gas Optimization Best Practices

### Variables & Storage

- `constant` - stored in bytecode, not storage. Naming convention: `ALL_CAPS`. Saves ~2,100 gas per read.
- `immutable` - set in constructor, stored in bytecode. Naming: `i_variableName`. Saves ~2,100 gas per read.
- `struct packing` - use smaller uints (uint8, uint32, uint64, uint128) when possible. Multiple variables <32 bytes can share one storage slot (saves 20,000 gas per avoided slot).
- Naming conventions: `s_` for storage vars (testing), `i_` for immutable, `ALL_CAPS` for constants

### Error Handling

- `custom errors` (Solidity ≥0.8.4) - more gas efficient than `require` strings. Syntax: `error ContractName__ErrorDescription();`
  - Custom errors use 4-byte error signature vs full string encoding in `require`
  - Save ~40-50 gas compared to `require` with error strings

### Arithmetic & Comparisons

- `unchecked {}` blocks - skip overflow/underflow checks (Solidity ≥0.8.0) when safe. Saves ~20-40 gas per operation.
- Use `!= 0` instead of `> 0` for uints (saves ~3 gas)
- Strict inequalities (`<`, `>`) use 1 opcode; `<=` and `>=` use 2 opcodes (LT/GT + ISZERO)
- [++i vs i++](https://ethereum.stackexchange.com/questions/133161/why-does-i-cost-less-gas-than-i) - prefix saves ~5 gas

### Function Optimization

- Short, optimized [function names](https://blog.emn178.cc/en/post/solidity-gas-optimization-function-name/) save gas - function selector order matters ([optimizer tool](https://gist.github.com/IllIllI000/a5d8b486a8259f9f77891a919febd1a9))
- `external` vs `public` - external is cheaper for functions not called internally (saves copying to memory)
- `calldata` vs `memory` - use calldata for read-only function parameters (saves ~60-80 gas per parameter)

### Measurement Tools

- [Hardhat gas reporter](https://www.npmjs.com/package/hardhat-gas-reporter) 
- [Foundry Snapshot](https://book.getfoundry.sh/forge/gas-snapshots) - track gas changes over time

---

## 5 Key Areas for Gas Optimization

1. **Deployment** - minimize contract size, use minimal proxy patterns (EIP-1167)
2. **Computation** - optimize opcodes, use unchecked math, short-circuit conditionals
3. **Transaction data (calldata)** - minimize function parameters, use bytes32 vs string
4. **Memory** - avoid large arrays, be mindful of quadratic cost growth
5. **Storage** - pack structs, use mappings over arrays, minimize SSTORE operations

---

## Compiler Optimization

- **Optimizer runs**: Set based on expected function call frequency. Higher runs = more expensive deployment, cheaper runtime.
  - `200` runs (default) - balanced
  - `1-50` runs - frequently deployed contracts (factories)
  - `1000+` runs - contracts called frequently (core protocols like [Uniswap](https://etherscan.io/address/0xe592427a0aece92de3edee1f18e0157c05861564#code))
- **IR-based optimizer** (`via_ir = true` in foundry.toml) - use for modern contracts, enables advanced optimizations across functions

---

## Advanced Techniques

- [Gas puzzles](https://github.com/RareSkills/gas-puzzles) - practice optimization challenges
- [Yul](https://docs.soliditylang.org/en/latest/yul.html) - inline assembly for gas-critical sections
- [Huff](https://docs.huff.sh/) - direct EVM bytecode language ([starter kit](https://github.com/smartcontractkit/huff-starter-kit) | [basics](https://www.youtube.com/watch?v=UWY27vL1cw4))
- Solidity vs Vyper [gas comparison](https://github.com/PatrickAlphaC/sc-language-comparison)
- [CREATE2](https://docs.soliditylang.org/en/latest/control-structures.html#salted-contract-creations-create2) - deterministic address deployment

---

## EVM Limits & Technical Constraints

### Hard Limits (Cannot Exceed)

| Limit | Value | Impact | Workaround |
|-------|-------|--------|-----------|
| **Stack depth** | 1,024 items | Stack overflow = transaction fails | Reduce local variables, use memory |
| **Stack item size** | 32 bytes (256 bits) | All values are 32 bytes | Type casting when needed |
| **Contract size** | 24,576 bytes (24 KB) | Deployment fails if exceeded | Libraries, proxy patterns, modular design |
| **Storage slots** | 2²⁵⁶ | Virtually unlimited | N/A |
| **Memory size** | Unlimited* | *Quadratic cost makes large sizes impractical | Avoid large arrays |
| **Calldata size** | Block gas limit | ~2 MB in practice | Split into multiple transactions |

### Gas Limits (Economic Constraints)

| Limit | Value (2026) | Notes |
|-------|-------------|-------|
| **Block gas limit** | 60M gas | Fusaka EIP-7935 (Dec 2025), previously 30M |
| **Transaction gas limit** | 16.7M gas | Fusaka EIP-7825 (Dec 2025), prevents single tx monopoly |
| **BaseFee** | Dynamic | Determined by network congestion (EIP-1559) |
| **Max priority fee** | User-defined | Tip to validator (block proposer) |
| **Gas refund cap** | 20% of gas used | Max refund from SSTORE deletions (EIP-3529) |

### Stack Overflow Prevention

```solidity
// Risk of stack too deep
function complexFunction(
    uint256 a, uint256 b, uint256 c, uint256 d,
    uint256 e, uint256 f, uint256 g, uint256 h
) public {
    uint256 x = a + b;
    uint256 y = c + d;
    uint256 z = e + f;
    // ... more local variables
    // Error: Stack too deep (>16 variables)
}

// Solution 1: Use fewer variables
function optimizedFunction(uint256 a, uint256 b) public {
    uint256 result;
    result = a + b;
    // Reuse 'result' instead of creating new variables
}

// Solution 2: Use struct
struct Params {
    uint256 a; uint256 b; uint256 c; uint256 d;
}
function structFunction(Params memory p) public {
    // Access via p.a, p.b, etc.
}

// Solution 3: Use assembly
function assemblyFunction(uint256 a, uint256 b) public returns (uint256) {
    assembly {
        let result := add(a, b)
        mstore(0x00, result)
        return(0x00, 0x20)
    }
}
```

### Contract Size Limit (EIP-170)

**24,576 bytes (24 KB)** max deployed bytecode

**Workarounds:**
1. **Libraries**: Extract code into separate library contracts
2. **Proxy patterns**: Keep implementation logic in upgradeable contracts
3. **Inheritance**: Split into multiple base contracts
4. **Optimizer settings**: Use higher runs for deployment (worse runtime gas)
5. **Refactoring**: Remove unused code, inline small functions

**Check contract size:**
```bash
# Foundry
forge build --sizes

# Hardhat
npx hardhat size-contracts
```

### Call Depth Limit (Historical)

- **Original limit**: 1,024 nested calls
- **EIP-150** (Tangerine Whistle, 2016): 63/64 gas forwarding rule
- **Impact**: Effectively eliminated call depth attacks
- **Modern relevance**: Rarely encountered in practice

---

## Recent Opcode Additions

| Opcode | Hardfork | EIP | Description | Impact |
|--------|----------|-----|-------------|--------|
| **PUSH0** | Shanghai (Apr 2023) | EIP-3855 | Push constant 0 | Saves 2 gas vs PUSH1 0 |
| **TSTORE/TLOAD** | Dencun (Mar 2024) | EIP-1153 | Transient storage | 100 gas (not persisted) |
| **MCOPY** | Dencun (Mar 2024) | EIP-5656 | Efficient memory copy | Cheaper than loop |
| **BLOBHASH** | Dencun (Mar 2024) | EIP-4844 | Access blob data | L2 rollup data |
| **CLZ** | Fusaka (Dec 2025) | EIP-7939 | Count leading zeros | Bit manipulation |
| **BLS12-381** | Pectra (May 2025) | EIP-2537 | BLS signature precompile | Validator sigs |
| **secp256r1/P-256** | Fusaka (Dec 2025) | EIP-7951 | P-256 precompile | WebAuthn, passkeys |

**Transient storage** (`TSTORE`/`TLOAD`) is particularly useful for:
- Reentrancy locks (cleared after transaction)
- Temporary state in flash loans
- Cross-function communication within a transaction

---

[← Back to Main](../README.md) | [Next: Security →](security.md)
