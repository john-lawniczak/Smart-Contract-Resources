# Ethereum Consensus & EVM Architecture

**Last verified: 2026-01**

> A concise reference guide based on [Mastering Ethereum (2nd Edition)](https://masteringethereum.xyz/). For comprehensive coverage, refer to the full book.

---

## Table of Contents

- [Consensus Mechanisms](#consensus-mechanisms)
- [Ethereum Clients](#ethereum-clients)
- [Validators & Nodes](#validators--nodes)
- [EVM Architecture](#evm-architecture)
- [Block Production](#block-production)
- [Network Layer](#network-layer)

---

## Consensus Mechanisms

### Proof-of-Stake (PoS) - Current (Post-Merge, Sept 2022)

Ethereum transitioned from Proof-of-Work to Proof-of-Stake via "The Merge" on September 15, 2022.

#### Key Components

**1. Validators**
- **Stake requirement**: 32 ETH minimum to activate validator
- **Max effective balance**: 2048 ETH (post-Pectra, May 2025)
- **Duties**: Propose blocks, attest to blocks, participate in sync committees
- **Rewards**: Base rewards + tips + MEV (via MEV-Boost)
- **Penalties**: Inactivity leaks, slashing for provable misbehavior

**2. Casper FFG (Friendly Finality Gadget)**
- Provides economic finality through checkpoints
- **Checkpoints**: First block of each epoch (every 32 slots)
- **Justification**: Checkpoint with ≥2/3 validator votes
- **Finalization**: Two consecutive justified checkpoints
- **Finality time**: ~13 minutes (2 epochs)

**3. LMD GHOST (Fork Choice Rule)**
- **Latest Message Driven**: Uses most recent validator attestations
- **GHOST**: Greedy Heaviest Observed SubTree
- **Function**: Choose fork with most attestations (weight), not longest chain
- **Integration**: Works with Casper FFG for short-term fork choice

#### Time Structure

```
Slot (12 seconds)
  └─> 1 block proposer
  └─> All validators attest

Epoch (32 slots = ~6.4 minutes)
  └─> Checkpoint for finality
  └─> Validator committee rotation
  └─> Each validator attests once

Finalization (~2 epochs = ~13 minutes)
  └─> Irreversible blocks
  └─> Economic security via slashing
```

#### Attestation Components

Each validator attestation votes on:
1. **Source checkpoint**: Last justified checkpoint (from previous epoch)
2. **Target checkpoint**: Current epoch's checkpoint being voted on
3. **Head block**: Validator's view of chain tip (for LMD GHOST)

**Aggregation**: BLS signatures enable efficient aggregation of thousands of attestations into single signature

#### Slashing Conditions

Validators are slashed (penalized + forcibly exited) for:
1. **Double voting**: Attesting to two different blocks at same slot
2. **Surround voting**: Creating attestations that "surround" previous attestation
3. **Double proposing**: Proposing two different blocks for same slot

**Penalties**:
- Initial penalty: ~1 ETH
- Correlation penalty: Increases if many validators slashed simultaneously
- Maximum penalty: Up to entire stake (in extreme cases)

---

## Ethereum Clients

### Client Architecture (Post-Merge)

Ethereum now requires **two clients** to run a full node:

#### 1. Execution Client (formerly "Eth1" client)
**Responsibilities**:
- Transaction pool (mempool) management
- EVM execution
- State management (accounts, storage, code)
- Provides execution payload to consensus client

**Major Implementations**:
- **[Geth](https://geth.ethereum.org/)** (Go) - Most popular, ~70% of nodes
- **[Nethermind](https://nethermind.io/)** (.NET) - High performance
- **[Besu](https://besu.hyperledger.org/)** (Java) - Enterprise-focused
- **[Erigon](https://github.com/ledgerwatch/erigon)** (Go) - Optimized for disk space
- **[Reth](https://github.com/paradigmxyz/reth)** (Rust) - New, performance-focused

**APIs Provided**:
- JSON-RPC API (read/write blockchain data)
- Engine API (communication with consensus client)

#### 2. Consensus Client (formerly "Eth2" or "Beacon" client)
**Responsibilities**:
- Block proposal and attestation
- Validator management
- Fork choice (LMD GHOST)
- Finality (Casper FFG)
- P2P networking for consensus

**Major Implementations**:
- **[Prysm](https://prysmaticlabs.com/)** (Go) - Most popular
- **[Lighthouse](https://lighthouse.sigmaprime.io/)** (Rust) - Security-focused
- **[Teku](https://consensys.net/knowledge-base/ethereum-2/teku/)** (Java) - Enterprise features
- **[Nimbus](https://nimbus.team/)** (Nim) - Resource-efficient
- **[Lodestar](https://lodestar.chainsafe.io/)** (TypeScript) - Browser-compatible

### Client Diversity

**Why it matters**: Network resilience against bugs in single client implementation

**Current Distribution (2026)**:
- Execution: Geth ~70%, Nethermind ~15%, Besu ~8%, Others ~7%
- Consensus: Prysm ~40%, Lighthouse ~35%, Teku ~15%, Others ~10%

**Best practice**: Run minority clients to improve network resilience

### Node Types

**1. Full Node**
- Stores full blockchain state
- Validates all blocks and transactions
- Requires ~1TB+ disk space (execution) + ~100GB (consensus)
- Can serve data to other nodes

**2. Archive Node**
- Stores full historical state (all historical states)
- Required for dapps needing historical queries
- Requires ~12TB+ disk space
- Used by block explorers, analytics platforms

**3. Light Node**
- Downloads only block headers
- Requests data from full nodes on-demand
- Minimal disk space (~1GB)
- Trust assumptions on full nodes

---

## Validators & Nodes

### Running a Validator

#### Hardware Requirements (2026)

**Minimum**:
- CPU: 4+ cores
- RAM: 16GB
- Storage: 2TB SSD (NVMe recommended)
- Network: 10+ Mbps (25+ Mbps recommended)
- Uptime: 99%+ recommended

**Recommended**:
- CPU: 8+ cores
- RAM: 32GB
- Storage: 4TB NVMe SSD
- Network: 1Gbps
- UPS (uninterruptible power supply)
- Backup internet connection

#### Validator Setup Process

1. **Generate validator keys**
   - Use official [Ethereum Staking Deposit CLI](https://github.com/ethereum/staking-deposit-cli)
   - Creates withdrawal and signing keys
   - Produces deposit data file

2. **Fund the deposit contract**
   - Send 32 ETH to deposit contract
   - Include deposit data from key generation
   - Wait for deposit to be processed (~24 hours)

3. **Run execution + consensus clients**
   - Both must be synced and running
   - Configure validator keys in consensus client
   - Enable MEV-Boost for additional rewards (optional but recommended)

4. **Monitor validator performance**
   - Track attestation effectiveness
   - Monitor balance changes
   - Watch for missed duties

#### Validator Rewards (2026 estimates)

**Base Rewards**:
- ~4-5% APR on staked ETH (varies with total staked amount)
- Paid for: attestations, block proposals, sync committee participation

**Additional Rewards**:
- **Priority fees**: Tips paid by transactions (via MEV-Boost)
- **MEV rewards**: Extractable value from transaction ordering (via MEV-Boost)
- Combined: +1-3% APR typically, higher during volatile markets

**Total APR**: ~5-8% under normal conditions (2026)

#### Validator Penalties

**Inactivity Leak**:
- Occurs if network doesn't finalize for 4+ epochs
- Validators lose stake proportional to downtime
- Designed to restore finality by reducing inactive validator stake

**Minor Penalties**:
- Missed attestations: Small penalty per missed attestation
- Late attestations: Reduced rewards
- No slashing, just reduced earnings

### Node Operations

#### Running a Non-Validating Full Node

**Benefits**:
- Full verification of all blocks
- Private transaction submission
- Local blockchain queries
- Support network decentralization
- No staking requirement

**Setup**:
1. Install execution client (e.g., Geth)
2. Install consensus client (e.g., Lighthouse)
3. Configure both to communicate via Engine API
4. Sync (~1-3 days for full sync)

#### Checkpoint Sync (Fast Sync)

- Start consensus client from recent finalized checkpoint
- Reduces sync time from days to hours
- Must trust checkpoint source
- Common checkpoint sources: [https://eth-clients.github.io/checkpoint-sync-endpoints/](https://eth-clients.github.io/checkpoint-sync-endpoints/)

---

## EVM Architecture

### Stack-Based Virtual Machine

**Key Characteristics**:
- **Stack size**: 1024 elements max
- **Word size**: 256 bits (32 bytes)
- **Memory**: Byte-addressable, dynamically sized, quadratic cost growth
- **Storage**: Key-value store, 256-bit → 256-bit, persists between transactions
- **Execution**: Deterministic, single-threaded

### Gas System

**Purpose**: Prevent DoS, meter resource consumption, incentivize efficiency

**Gas Components**:
- **Gas limit**: Maximum gas transaction can consume
- **Gas used**: Actual gas consumed
- **Gas price**: Amount paid per unit of gas (in wei)
- **Base fee**: Burned portion (EIP-1559)
- **Priority fee**: Tip to validator

**Transaction cost**:
```
Total cost = (base fee + priority fee) × gas used
Burned = base fee × gas used
Validator receives = priority fee × gas used
```

### Memory Layout

**Memory Regions**:
- **0x00-0x20**: Scratch space (temporary calculations)
- **0x20-0x40**: Scratch space (temporary calculations)
- **0x40-0x60**: Free memory pointer (points to next free memory slot)
- **0x60-0x80**: Zero slot (always returns zero, used as default)
- **0x80+**: General use (start of user-allocated memory)

**Cost Model**:
- First 724 bytes: Relatively cheap (~3 gas per word)
- Beyond: Quadratic cost growth (memory_cost = memory_size² / 512)
- Reason: Incentivize efficient memory use

### Storage Layout

**Structure**:
- Persistent key-value store per contract
- Each key/value is 256 bits (32 bytes)
- Organized into 2²⁵⁶ slots

**Gas Costs** (2026):
- **SSTORE (cold, new)**: 20,000 gas
- **SSTORE (warm, modify)**: 5,000 gas (after EIP-2929)
- **SLOAD (cold)**: 2,100 gas
- **SLOAD (warm)**: 100 gas (after EIP-2929)
- **Refund (clearing storage)**: 15,000 gas (max 20% of transaction gas)

**Cold vs Warm Access** (EIP-2929):
- **Cold**: First access to storage slot or address in transaction
- **Warm**: Subsequent accesses in same transaction
- Encourages batching related operations

### Opcodes

**Categories**:
1. **Arithmetic**: ADD, SUB, MUL, DIV, MOD, EXP, ADDMOD, MULMOD
2. **Comparison**: LT, GT, EQ, ISZERO, AND, OR, XOR, NOT
3. **Cryptographic**: SHA3 (Keccak256), ECRECOVER
4. **Stack Operations**: PUSH, POP, DUP, SWAP
5. **Memory**: MLOAD, MSTORE, MSTORE8
6. **Storage**: SLOAD, SSTORE
7. **Execution Control**: JUMP, JUMPI, PC, STOP, RETURN, REVERT
8. **Block Information**: BLOCKHASH, COINBASE, TIMESTAMP, NUMBER, DIFFICULTY, GASLIMIT
9. **Contract Operations**: CREATE, CREATE2, CALL, DELEGATECALL, STATICCALL, SELFDESTRUCT

**Recent Additions**:
- **PUSH0** (Shanghai, Apr 2023): Push constant 0 (saves gas)
- **TSTORE/TLOAD** (Dencun, Mar 2024): Transient storage (cleared after transaction)
- **MCOPY** (Dencun, Mar 2024): Efficient memory copying
- **BLOBHASH** (Dencun, Mar 2024): Access blob transaction hashes
- **CLZ** (Fusaka, Dec 2025): Count leading zeros

**Interactive Playground**: [evm.codes](https://www.evm.codes/)

### Contract Bytecode

**Structure**:
1. **Creation bytecode**: Executed once during contract deployment
2. **Runtime bytecode**: Stored on-chain, executed for every call

**Deployment Process**:
```
1. Transaction sent with creation bytecode in data field
2. EVM executes creation bytecode
3. Creation bytecode returns runtime bytecode
4. Runtime bytecode stored at contract address
5. Constructor logic runs (part of creation bytecode)
```

**Contract Interaction**:
```
1. Transaction sent to contract address with calldata
2. EVM loads contract's runtime bytecode
3. First 4 bytes of calldata = function selector
4. EVM jumps to corresponding function
5. Function executes, returns result
```

### Call Types

**1. CALL**
- Regular external call
- Target contract executes in its own context
- Can modify target's storage
- Can send ETH

**2. DELEGATECALL**
- Execute target code in caller's context
- Target code modifies caller's storage
- Used for: libraries, proxy patterns, upgradeable contracts
- Cannot send ETH

**3. STATICCALL**
- Read-only call (no state modifications)
- Used for view/pure functions
- Reverts if target tries to modify state
- Cannot send ETH

**4. CALLCODE** (deprecated)
- Old version of DELEGATECALL
- msg.sender is immediate caller (not original)
- Avoid in new contracts

---

## Block Production

### Block Lifecycle (PoS)

**1. Validator Selection**
```
Slot N (12 seconds before block time):
└─> One validator randomly selected as proposer for Slot N+1
└─> Selection based on RANDAO (pseudo-random from validator contributions)
└─> Cannot be predicted far in advance
```

**2. Block Proposal**
```
Selected validator:
1. Requests execution payload from execution client
   └─> Execution client builds block with transactions from mempool
   └─> Applies EIP-1559 gas pricing
   └─> Executes transactions, updates state
   └─> Returns execution payload to consensus client

2. Consensus client creates beacon block containing:
   └─> Execution payload (transactions, state root, receipts root)
   └─> Attestations from previous slots
   └─> Slashing evidence (if any)
   └─> Voluntary exits (if any)
   └─> Sync committee contributions

3. Validator signs block with BLS signature

4. Block broadcasted to network via gossipsub P2P protocol
```

**3. Block Attestation**
```
All active validators attest to block:
└─> Vote on source checkpoint (previous epoch)
└─> Vote on target checkpoint (current epoch)
└─> Vote on head block (this slot)

Attestations included in subsequent blocks
Aggregated using BLS signature aggregation
```

**4. Finalization**
```
After 2 epochs (~13 minutes):
└─> If checkpoint receives ≥2/3 attestations: JUSTIFIED
└─> If next checkpoint also justified: Previous checkpoint FINALIZED
└─> Finalized blocks irreversible (economic security)
```

### MEV-Boost (Optional but Common)

**Standard block production**: Validator builds block locally using execution client

**MEV-Boost block production**:
```
1. Validator registers with MEV relays
2. Block builders compete to build highest-value blocks
3. Builders submit sealed bids to relays (block header + bid amount)
4. Validator selects highest bid without seeing block contents
5. Validator commits to selected block header
6. Relay reveals full block to validator
7. Validator proposes block, receives bid payment
```

**Benefits**:
- Higher validator rewards (~1-3% additional APR)
- Professional block building (better MEV extraction)

**Concerns**:
- Centralization of block building
- Censorship risks (OFAC-compliant blocks)
- Trust in relays

### Block Structure

**Beacon Block (Consensus Layer)**:
```yaml
slot: 1234567
proposer_index: 42
parent_root: 0xabc...
state_root: 0xdef...
body:
  randao_reveal: BLS_signature
  eth1_data: {...}
  graffiti: 0x...
  proposer_slashings: [...]
  attester_slashings: [...]
  attestations: [...]
  deposits: [...]
  voluntary_exits: [...]
  sync_aggregate: {...}
  execution_payload: {...}  # Contains execution block
```

**Execution Payload (Execution Layer)**:
```yaml
parent_hash: 0x123...
fee_recipient: 0xValidator_address
state_root: 0x456...
receipts_root: 0x789...
logs_bloom: 0x...
prev_randao: 0x...
block_number: 18500000
gas_limit: 30000000
gas_used: 15000000
timestamp: 1704067200
extra_data: 0x...
base_fee_per_gas: 25000000000  # 25 gwei
block_hash: 0xabc...
transactions: [...]  # RLP-encoded transactions
withdrawals: [...]   # Validator withdrawals (post-Shanghai)
```

---

## Network Layer

### P2P Networking

**Consensus Layer (libp2p-based)**:
- **GossipSub**: Topic-based pubsub for message propagation
- **Req/Resp**: Request-response protocol for sync
- **Topics**: Separate topics for blocks, attestations, exits, etc.
- **Discovery**: Discv5 for peer discovery

**Execution Layer**:
- **DevP2P**: Ethereum's custom P2P protocol
- **ETH protocol**: Blockchain sync and transaction propagation
- **LES**: Light Ethereum Subprotocol (for light clients)
- **Discovery**: Node discovery via UDP

### Network Upgrades

**Hard Forks** (Coordinated upgrades):
- **Shanghai** (Apr 2023): Staking withdrawals, PUSH0 opcode
- **Dencun** (Mar 2024): Blob transactions (EIP-4844), transient storage
- **Pectra** (May 2025): EOA delegation, validator consolidation, blob increases
- **Fusaka** (Dec 2025): PeerDAS, increased gas limits

**Upgrade Process**:
1. EIP proposals and discussion
2. Testing on testnets (Sepolia, Holesky)
3. Client implementations
4. Coordinated activation at specific block/slot

---

## Additional Resources

### Official Documentation
- [Ethereum.org - Consensus](https://ethereum.org/en/developers/docs/consensus-mechanisms/)
- [Ethereum.org - Proof-of-Stake](https://ethereum.org/en/developers/docs/consensus-mechanisms/pos/)
- [Eth2Book](https://eth2book.info/) - Deep dive into consensus layer

### Client Documentation
- [Geth Documentation](https://geth.ethereum.org/docs)
- [Prysm Documentation](https://docs.prylabs.network/)
- [Lighthouse Book](https://lighthouse-book.sigmaprime.io/)

### Node/Validator Guides
- [Ethereum Staking Guide](https://ethereum.org/en/staking/)
- [Rocket Pool Node Guide](https://docs.rocketpool.net/)
- [CoinCashew's Ethereum Staking Guide](https://www.coincashew.com/coins/overview-eth/guide-or-how-to-setup-a-validator-on-eth2-mainnet)

### EVM Deep Dives
- [EVM Codes](https://www.evm.codes/) - Interactive opcode reference
- [EVM.Storage](https://evm.storage/) - Storage layout visualization
- [Solidity Docs - Internals](https://docs.soliditylang.org/en/latest/internals/)

### Books
- **[Mastering Ethereum (2nd Edition)](https://masteringethereum.xyz/)** - Comprehensive reference (this guide is based on it)

---

[← Back to Main](../README.md)
