## Smart Contract Resources

A comprehensive, curated collection of EVM development resources, security tools, DeFi protocols, and vulnerable contract examples for learning and auditing.

---

### 📚 Table of Contents

**Getting Started**
- [Core References](#core-references) - essential documentation and learning materials
- [Tooling](#tooling) - development environments, static analysis, fuzzing tools

**Gas & EVM Internals**
- [Opcodes | Gas Optimization | Storage and Memory](#opcodes--gas-optimization--storage-and-memory) - gas optimization strategies and EVM limits

**Transactions & Signatures**
- [Transactions and Signatures](#transactions-and-signatures) - transaction types, ECDSA components

**Security & Auditing**
- [Hacks and Security](#hacks-and-security) - attack vectors, audit resources, testing strategies
- [Testing & Verification](#testing--verification) - fuzzing, invariants, formal verification
- [Bug Bounty Platforms](#bug-bounty-platforms) - Code4rena, Immunefi, Sherlock, etc.
- [AI-Assisted Security & Development](#ai-assisted-security--development) - AI tools, MCP servers

**DeFi Ecosystem**
- [DeFi](#defi-decentralized-finance) - DEXs, lending protocols, derivatives
- [Modern DeFi Trends](#modern-defi-trends-2025-2026) - RWA, restaking, intents, account abstraction
- [Stablecoins](#stablecoins) - types, risks, oracle security
- [MEV](#mev) - maximal extractable value, PBS architecture, protection strategies

**Advanced Topics**
- [Finance, Markets & Security Reading](#finance-markets--security-reading) - books on Web3 security and TradFi parallels
- [Tokens](#tokens) - ERC standards (20, 721, 1155, 4626, etc.)
- [Dictionary of Key Terms](#dictionary-of-key-terms-solidity) - comprehensive Solidity/DeFi glossary

**Infrastructure & Career**
- [Contract Deployment](#contract-deployment) - deployment commands
- [Wallets](#wallets) - browser, mobile, hardware, and smart contract wallets
- [Teams to Connect With](#teams-to-connect-with) - security firms and dev shops
- [Jobs](#jobs) - job boards for Web3 opportunities

---

### Core References

**Essential Documentation:**
- [Mastering Ethereum (2nd Edition)](https://masteringethereum.xyz/) - comprehensive Ethereum guide
- Solidity [documentation](https://docs.soliditylang.org/en/latest/) and [cheatsheet](https://docs.soliditylang.org/en/latest/cheatsheet.html) - official language docs
- [Ethereum developer docs](https://ethereum.org/en/developers/docs/) - network and protocol specs
- [OpenZeppelin Contracts docs](https://docs.openzeppelin.com/contracts/) - secure contract implementations
- [Solidity by Example](https://solidity-by-example.org/) - hands-on code examples

**Learning Resources:**
- [RareSkills GitHub](https://github.com/RareSkills) - advanced security and gas optimization content
- [RareSkills 140 Ethereum Developer Interview Questions](https://www.rareskills.io/post/solidity-interview-questions) - comprehensive interview prep

**News & Incident Tracking:**
- [Blockthreat Intelligence](https://newsletter.blockthreat.io/) - weekly security updates
- [Rekt](https://rekt.news/) - DeFi hack post-mortems and analysis
- [DeFiLlama Hacks Database](https://defillama.com/hacks) - comprehensive hack tracker with TVL
- [Web3 is Going Great](https://web3isgoinggreat.com/) - critical timeline of crypto incidents

**Opinion & Analysis:**
- [Matt Levine](https://www.bloomberg.com/opinion/authors/ARbTQlRLRjE/matthew-s-levine) (Bloomberg Opinion) - finance and markets columnist, [recommended by Dan Robinson](https://youtu.be/Lz7g0ny99jk?t=3183)

**Podcasts:**
- [Bankless](http://podcast.banklesshq.com/) - Ethereum and DeFi news and interviews
- [Unchained](https://unchainedcrypto.com/podcasts/) - crypto news and deep dives with Laura Shin
- [Scraping Bits](https://rss.com/podcasts/scrapingbits/) - technical security and development discussions    

### Tooling

**Development Environments:**
- [Remix](https://remix.ethereum.org/) - browser-based IDE for quick prototyping
- [Foundry](https://book.getfoundry.sh/) - fast Solidity testing framework. See also: [Awesome Foundry](https://github.com/crisgarner/awesome-foundry), [Cheat Codes](https://book.getfoundry.sh/cheatcodes/)
- [Hardhat](https://hardhat.org/hardhat-runner/docs/getting-started#overview) - Ethereum development environment. Features: [forking mainnet](https://hardhat.org/hardhat-network/docs/guides/forking-other-networks), console.log via `import "hardhat/console.sol"`

**Static Analysis & Security:**
- [Slither](https://github.com/crytic/slither) - static analyzer with MCP (Model Context Protocol) support for AI assistants

**Fuzzing & Dynamic Analysis:**
- [Echidna](https://github.com/crytic/echidna) - property-based fuzzer (Haskell-based). See: [fuzzing guide](https://bushido-sec.com/index.php/2023/07/27/fuzzing-smart-contracts/)
- [Medusa](https://github.com/crytic/medusa) - coverage-guided fuzzer (Go-based, faster than Echidna with parallel workers)
- [Mythril](https://github.com/ConsenSys/mythril) - symbolic execution, SMT solving, and taint analysis. See also: [MythX](https://github.com/muellerberndt/awesome-mythx-smart-contract-security-tools)

**Libraries & SDKs:**
- [Ethers.js](https://docs.ethers.org/v5/single-page/) - Ethereum library and wallet implementation
- [Web3.js](https://web3js.org/#/) - Ethereum JavaScript API
- [Wagmi](https://wagmi.sh/) - React hooks for Ethereum

- [Inline bookmarks](https://marketplace.visualstudio.com/items?itemName=tintinweb.vscode-inline-bookmarks) - VSCode extension for audit notes (e.g., `// @audit`)

----- 


## Opcodes | Gas Optimization | Storage and Memory

### Core Resources
- [Solidity Internals: Layout in memory](https://docs.soliditylang.org/en/latest/internals/layout_in_memory.html)   
- [Solidity Internals: Layout in storage](https://docs.soliditylang.org/en/latest/internals/layout_in_storage.html)
- [Solidity Contract Layout Guide](https://github.com/Cyfrin/foundry-full-course-f23#solidity-contract-layout) - best practices for organizing Solidity code
- [Solidity Optimizer](https://docs.soliditylang.org/en/latest/internals/optimizer.html) - IR-based (`via_ir`) optimizer recommended for modern contracts
- [EVM Opcodes Reference](https://ethereum.org/en/developers/docs/evm/opcodes/) - official docs | [evm.codes](https://www.evm.codes/) - interactive playground   
- [4byte signature DB](https://www.4byte.directory/) or [OpenChain](https://openchain.xyz/signatures)   
- [EVM Storage Explorer](https://evm.storage/) - visualize storage layout   

### Gas-Optimized Libraries
- [Solady](https://github.com/Vectorized/solady) - highly optimized Solidity library with assembly
- [Solmate](https://github.com/transmissions11/solmate) - gas-optimized building blocks

### Learning Resources
- Patrick Collins [storage walkthrough](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=42469) - [FunWithStorage contract](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=42690)      
- [Brief storage video](https://youtu.be/_YkulBTqIcQ?t=522)    
- [Storage vs Memory explained](https://soliditytips.com/articles/solidity-data-location-storage-memory/)   
- [Gas-optimization course](https://www.udemy.com/course/advanced-solidity-understanding-and-optimizing-gas-costs/?referralCode=C4684D6872713525E349) by Jeffrey Scholz ([RareSkills](https://github.com/RareSkills))   
- Foundry Debugger [tutorial](https://youtu.be/sas02qSFZ74?list=PL4Rj_WH6yLgWe7TxankiqkrkVKXIwOP42&t=25270)   


[Play with opcodes](https://www.evm.codes/playground)      

**Recent Opcode Additions:**
- `PUSH0` - push constant 0 onto stack (Shanghai, April 2023, EIP-3855) - saves gas vs `PUSH1 0`
- `TSTORE`/`TLOAD` - transient storage opcodes (Dencun, March 2024, EIP-1153)
- `MCOPY` - efficient memory copying opcode (Dencun, March 2024, EIP-5656)
- `BLOBHASH` - blob hash opcode for EIP-4844 blob data (Dencun, March 2024)
- `CLZ` - count leading zeros (Fusaka, Dec 2025, EIP-7939)
- BLS12-381 precompile addresses (Pectra, May 2025, EIP-2537)
- secp256r1/P-256 precompile (Fusaka, Dec 2025, EIP-7951)

[Block](https://ethereum.org/en/developers/docs/blocks/) gas limit: 30M (pre-Fusaka), 60M (Fusaka EIP-7935, Dec 2025). New block every ~12 seconds; memory explosion due to quadratic growth   
`Max transaction gas limit` - individual transaction gas cap: 16.7M (Fusaka EIP-7825, Dec 2025), preventing single transactions from consuming excessive block space   
`BaseFee` - is burned; determined by network; Solidity can access via `block.basefee`   
`Max Fee` - most willing to pay; upper bound of gas price   
`Max priority fee` - most you are willing to give to the validator (block proposer)   
`Priority fee` - most willing to give to validator out of what's left when max fee is subtracted from basefee, aka validator tip   
`cold access` vs `warm access` - cold access (2100 gas) the first time you read a storage slot or call a contract in a transaction; warm access (100 gas) for subsequent reads/calls in the same transaction. Introduced in EIP-2929 (Berlin, April 2021)  

|   type  | address | bool | uint8 | uint16 | uint32 | uint64 | uint128 | uint256 |
|-------|---------|------|-------|--------|--------|--------|---------|---------|
| bytes | 20      | 1    | 1     | 2      | 4      | 8      | 16      | 32      |


`0x40` - the free memory pointer; a "pointer" is an address within memory and the free memory pointer is the address pointing to the start of unallocated, free memory.    
`0x80` - action begins   
`scratch space slots` - [0x00-0x-20), [0x20-0x40)   
`offset` - determines where within the 256-bit slot a particular piece of data begins; eg. if you have two uint128 variables (128 bits in size), the first will start at an offset of 0 and the second will start at an offset of 128.    

[bit masking](https://stackoverflow.com/questions/10493411/what-is-bit-masking) - defines which bits you want to keep, and which bits you want to clear      
`short circuiting` — order matters, cheaper operation first for performance     
`bit shifting` - using << (left shift for multiplication) and >> (right shift for division)     

### Gas Costs (Current as of 2026)
- **Transaction base cost**: 21,000 gas (intrinsic gas for any transaction)
- **Calldata**: 16 gas per non-zero byte, 4 gas per zero byte
- **Computational opcodes**: 2-10 gas for basic operations (ADD, SUB, MUL, etc.)
- **Storage operations**:
  - `SSTORE` (write to new slot): 20,000 gas (cold access)
  - `SSTORE` (modify existing): 5,000 gas (warm access)  
  - `SSTORE` (delete/set to zero): 5,000 gas (with 15,000 gas refund up to 20% of total gas)
  - `SLOAD` (read): 2,100 gas (cold), 100 gas (warm)
- **Memory**: First 724 bytes free; then quadratic cost (expensive for large arrays)
- **Logs**: `LOG0` 375 gas + 375 gas per topic + 8 gas per byte of data    
### Gas Optimization Best Practices

**Variables & Storage:**
- `constant` - stored in bytecode, not storage. Naming convention: `ALL_CAPS`. Saves ~2,100 gas per read.
- `immutable` - set in constructor, stored in bytecode. Naming: `i_variableName`. Saves ~2,100 gas per read.
- `struct packing` - use smaller uints (uint8, uint32, uint64, uint128) when possible. Multiple variables <32 bytes can share one storage slot (saves 20,000 gas per avoided slot).
- Naming conventions: `s_` for storage vars (testing), `i_` for immutable, `ALL_CAPS` for constants

**Error Handling:**
- `custom errors` (Solidity ≥0.8.4) - more gas efficient than `require` strings. Syntax: `error ContractName__ErrorDescription();`
  - Custom errors use 4-byte error signature vs full string encoding in `require`
  - Save ~40-50 gas compared to `require` with error strings

**Arithmetic & Comparisons:**
- `unchecked {}` blocks - skip overflow/underflow checks (Solidity ≥0.8.0) when safe. Saves ~20-40 gas per operation.
- Use `!= 0` instead of `> 0` for uints (saves ~3 gas)
- Strict inequalities (`<`, `>`) use 1 opcode; `<=` and `>=` use 2 opcodes (LT/GT + ISZERO)
- [++i vs i++](https://ethereum.stackexchange.com/questions/133161/why-does-i-cost-less-gas-than-i) - prefix saves ~5 gas

**Function Optimization:**
- Short, optimized [function names](https://blog.emn178.cc/en/post/solidity-gas-optimization-function-name/) save gas - function selector order matters ([optimizer tool](https://gist.github.com/IllIllI000/a5d8b486a8259f9f77891a919febd1a9))
- `external` vs `public` - external is cheaper for functions not called internally (saves copying to memory)
- `calldata` vs `memory` - use calldata for read-only function parameters (saves ~60-80 gas per parameter)

**Measurement Tools:**
- [Hardhat gas reporter](https://www.npmjs.com/package/hardhat-gas-reporter) 
- [Foundry Snapshot](https://book.getfoundry.sh/forge/gas-snapshots) - track gas changes over time

### 5 Key Areas for Gas Optimization
1. **Deployment** - minimize contract size, use minimal proxy patterns (EIP-1167)
2. **Computation** - optimize opcodes, use unchecked math, short-circuit conditionals
3. **Transaction data (calldata)** - minimize function parameters, use bytes32 vs string
4. **Memory** - avoid large arrays, be mindful of quadratic cost growth
5. **Storage** - pack structs, use mappings over arrays, minimize SSTORE operations

### Compiler Optimization
- **Optimizer runs**: Set based on expected function call frequency. Higher runs = more expensive deployment, cheaper runtime.
  - `200` runs (default) - balanced
  - `1-50` runs - frequently deployed contracts (factories)
  - `1000+` runs - contracts called frequently (core protocols like [Uniswap](https://etherscan.io/address/0xe592427a0aece92de3edee1f18e0157c05861564#code))
- **IR-based optimizer** (`via_ir = true` in foundry.toml) - use for modern contracts, enables advanced optimizations across functions

### Advanced Techniques
- [Gas puzzles](https://github.com/RareSkills/gas-puzzles) - practice optimization challenges
- [Yul](https://docs.soliditylang.org/en/latest/yul.html) - inline assembly for gas-critical sections
- [Huff](https://docs.huff.sh/) - direct EVM bytecode language ([starter kit](https://github.com/smartcontractkit/huff-starter-kit) | [basics](https://www.youtube.com/watch?v=UWY27vL1cw4))
- Solidity vs Vyper [gas comparison](https://github.com/PatrickAlphaC/sc-language-comparison)
- [CREATE2](https://docs.soliditylang.org/en/latest/control-structures.html#salted-contract-creations-create2) - deterministic address deployment

### EVM Technical Limits
- **Stack depth**: 1024 elements max. Exceeding causes transaction failure and full gas consumption.
- **Contract size**: 24,576 bytes (24 KB) max deployed bytecode (EIP-170). Solutions: libraries, proxy patterns, modular design.
- **Call depth**: Previously 1024; less critical after EIP-150's 63/64 gas forwarding rule.
- **Transaction gas cap**: 16.7M (Fusaka EIP-7825) per transaction; 60M per block (Fusaka EIP-7935).

-----

## Transactions and Signatures

### Transaction Types (EIP-2718 Typed Transaction Envelope)

Per *[Mastering Ethereum (2nd Edition)](https://masteringethereum.xyz/)*, Ethereum supports multiple transaction formats, each identified by a type prefix:

| Type | Name | EIP | Introduced | Description |
|------|------|-----|------------|-------------|
| **Type 0** | Legacy | Pre-EIP-2718 | Genesis | Original transaction format. No type prefix. Uses `gasPrice`. |
| **Type 1** (0x01) | Access List | [EIP-2930](https://eips.ethereum.org/EIPS/eip-2930) | Berlin (Apr 2021) | Adds `accessList` to pre-declare storage slots and addresses accessed. Reduces gas for cross-contract calls. |
| **Type 2** (0x02) | Dynamic Fee (EIP-1559) | [EIP-1559](https://eips.ethereum.org/EIPS/eip-1559) | London (Aug 2021) | Replaces `gasPrice` with `maxFeePerGas` and `maxPriorityFeePerGas`. Burns base fee, tips validators. |
| **Type 3** (0x03) | Blob Transaction | [EIP-4844](https://eips.ethereum.org/EIPS/eip-4844) | Dencun (Mar 2024) | Carries blob data for L2 rollups. Uses separate blob fee market. Max 6 blobs per block (Pectra). |
| **Type 4** (0x04) | Set Code (EOA Delegation) | [EIP-7702](https://eips.ethereum.org/EIPS/eip-7702) | Pectra (May 2025) | Allows EOAs to temporarily set account code for one transaction, enabling account abstraction features. |

**Key Points:**
- Type 2 (EIP-1559) is the most common transaction type as of 2026
- Type 3 (blob transactions) are primarily used by L2 rollups for data posting
- Type 4 enables EOAs to act like smart contracts temporarily without changing addresses
- Legacy (Type 0) transactions still work but are less gas-efficient

### ECDSA Signature Components (V, R, S)

All Ethereum transactions use ECDSA (Elliptic Curve Digital Signature Algorithm) signatures with three components:

- **R (32 bytes)**: The x-coordinate of the random point selected during the signing process
- **S (32 bytes)**: A deterministic value ensuring signature uniqueness and validity  
- **V (1 byte)**: The recovery ID used to identify the correct public key for signature verification. Also includes the chain ID to protect against replay attacks ([EIP-155](https://eips.ethereum.org/EIPS/eip-155))

These components allow the network to verify the transaction was signed by the sender's private key and cryptographically recover the sender's Ethereum address for validation.

-----

## Hacks and Security

- [Seal-911](https://github.com/security-alliance/seal-911)
  
-----   

### Audits
  
- `timeboxing` - allocate a fixed, maximum amount of time and step out of the rabbit hole; move on. 

Modern auditing checklist (concise):
- Invariants and state assertions: identify core system invariants; add invariant tests/fuzzing.
- Price/oracle safety: TWAP usage, observation cardinality sizing, staleness/heartbeat checks, manipulation resistance.
- AMM specifics: concentrated liquidity range math, fee accounting, [`JIT`](#jit-just-in-time-liquidity) exposure, LVR evaluation; hook integration for v4.
- Auth/roles: `onlyOwner`/roles scoping, upgrade paths, timelocks, pausability, guardian powers.
- External calls: CEI pattern, reentrancy coverage (including hooks/callbacks), pull over push flows.
- Token standards: ERC-20 quirks (fee-on-transfer, non-standard returns), ERC-721/1155 safety, [`ERC-4626`](#erc-4626-tokenized-vault-standard) rounding and preview/convert alignment.
- Economic sims: liquidation thresholds, interest kink params, funding-rate logic for [`perpetual futures`](#perpetual-futures-perp), auction/solver incentives for [`intents`](#intents).
- L2/L1 bridges: replay protection, message ordering, proof windows, sequencer liveness checks.


Most auditor discussions are on Twitter.   
- [Christoph Michel](https://learneos.dev/#packages) (#1 auditor on [Code4Arena](https://code4rena.com/leaderboard)) and [blog](https://cmichel.io/how-to-become-a-smart-contract-auditor/) mentions Khan A. for [Finance](https://www.khanacademy.org/economics-finance-domain/core-finance/derivative-securities))                   
- [Tincho](https://www.youtube.com/watch?v=A-T9F0anN1E&list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&index=5)
- [Pashov](https://twitter.com/pashovkrum) and [Pashov’s audits](https://github.com/pashov/audits/tree/master/solo)   
- [Andy Li's road map](https://youtu.be/-469Gcye-ZE)
- [0kage.eth road map](https://twitter.com/0kage_eth/status/1640795980101742592?s=46&t=ezf5V_RX8d4d4zdIpUUrWQ)        
- [Owen Thurm's Channel](https://www.youtube.com/@0xOwenThurm)   
- [Dacian's blog](https://dacian.me/smart-contract-auditor-portfolio)
- [Addison Spiegel](https://addison.is/posts/curve-whitehat) Curve Finance White Hat
  - [Etherscan transaction](https://etherscan.io/tx/0x006763dff653ecddfd3681181a29e7e6d6c2aaa7bafb27fe1376f3f7ce367c1e)
 

**Auditing Strategy:**
1. **Find a project, search for bugs** - systematic review approach
2. **Find a bug, search for projects** - pattern-based hunting across codebases
3. **Be fast with new updates** - track latest EIPs, compiler versions, and protocol upgrades
4. **Know your tools** - master static analyzers, fuzzers, and formal verification

-----

### Testing & Verification

#### Fuzzing (Dynamic Testing)

**Overview:** Automated testing technique that generates randomized inputs to discover unexpected behaviors, edge cases, and vulnerabilities.

**Fuzzing Types:**
- **Stateless Fuzzing** - each run starts with fresh state, tests individual functions in isolation
- **Stateful Fuzzing** - maintains state across runs, tests sequences of function calls and state transitions
- **Invariant-Based Fuzzing** - continuously validates system invariants across random operation sequences

**Modern Fuzzing Tools:**
- **[Echidna](https://github.com/crytic/echidna)** - property-based fuzzer (Haskell-based), advanced corpus management
- **[Medusa](https://github.com/crytic/medusa)** - coverage-guided fuzzer (Go-based), faster with parallel workers
- **Foundry Fuzz** - built-in fuzzing with `forge test`, configurable via `foundry.toml`

**Fuzzing Patterns to Test:**
- **Cross-Function Fuzzing** - test interactions between multiple functions
- **Price Feed Manipulation** - oracle manipulation via flash loans
- **Storage Slot Packing** - boundary conditions in packed storage
- **Decimal/Precision Loss** - rounding errors in financial calculations
- **Access Control Bypass** - privilege escalation attempts
- **Reentrancy Chains** - complex reentrancy across multiple contracts

**Key Concepts:**
- **Corpus** - collection of test inputs that achieved new coverage, reused across runs
- **Coverage** - percentage of code paths executed by fuzzer
- **Depth** - number of function calls in a single fuzzing run (handler-based testing)
- **Shrinking** - minimizing failing inputs to simplest reproducible case

**Foundry Fuzzing Configuration:**
```toml
[fuzz]
runs = 256              # number of scenarios per test
max_test_rejects = 65536
seed = '0x1'
dictionary_weight = 40
include_storage = true
include_push_bytes = true
```

**Learning Resources:**
- [Patrick Collins Fuzzing Intro](https://youtu.be/sas02qSFZ74?t=281c) (Lesson 7)
- [Trail of Bits Fuzzing Workshop](https://www.youtube.com/playlist?list=PLciHOL_J7Iwqdja9UH4ZzE8dP1IxtsBXI)
- [Handler-Based Testing](https://youtu.be/wUjYK5gwNZs?t=12443) - depth and state management
- [Fuzzing Uniswap V4](https://www.youtube.com/live/CwvD8dmTsRc) - real-world protocol fuzzing
- [Exploiting Precision Loss via Fuzzing](https://dacian.me/exploiting-precision-loss-via-fuzz-testing) - Dacian's guide
- [Foundry Debugger](https://youtu.be/sas02qSFZ74?list=PL4Rj_WH6yLgWe7TxankiqkrkVKXIwOP42&t=25270)

**Foundry Cheatcodes for Testing:**
- [`hoax`](https://youtu.be/sas02qSFZ74?t=5248) - prank + deal in one call
- [`txGasPrice`](https://youtu.be/sas02qSFZ74?t=5753) - set transaction gas price
- `vm.assume()` - add constraints to fuzz inputs
- `vm.expectRevert()` - test failure conditions

---

#### Invariant Testing (Property-Based Testing)

**Invariants** - properties that should ALWAYS hold true, regardless of state or operations performed.

**Two Types:**

**1. Function-Level Invariants**
- Don't rely on complex system state
- Can be tested in isolation
- Examples:
  - Associative property of addition: `(a + b) + c == a + (b + c)`
  - Token balance after deposit: `balanceAfter == balanceBefore + depositAmount`
  - ERC20 total supply: `sum(all balances) == totalSupply`

**2. System-Level Invariants**
- Require deployment of entire system or large subsystems
- Usually stateful and test cross-contract interactions
- Examples:
  - **Assets ≥ Liabilities**: Protocol's total value ≥ user obligations
  - **Monotonic Yield**: Yield-bearing token exchange rate only increases
  - **Solvency**: `totalBorrows ≤ totalCollateral * LTV`
  - **Conservation of Value**: Tokens in + tokens out = 0 (no creation/destruction)

**Common DeFi Invariants:**
```solidity
// Lending protocol
assert(totalAssets >= totalBorrows);
assert(utilizationRate <= 100%);

// AMM
assert(k == reserveA * reserveB); // constant product
assert(totalSupply > 0 || (reserveA == 0 && reserveB == 0));

// Staking
assert(totalShares == 0 || rewardPerShare >= lastRewardPerShare);
assert(userStaked <= totalStaked);
```

**Resources:**
- [Patrick Collins Invariant Testing](https://youtu.be/wUjYK5gwNZs?t=12220)
- [RareSkills Invariant Testing Guide](https://www.rareskills.io/post/invariant-testing-solidity)
- [Foundry Invariant Testing Docs](https://book.getfoundry.sh/forge/invariant-testing)

---

#### Formal Verification (Mathematical Proofs)

**Overview:** Proving or disproving system correctness using mathematical models and symbolic execution.

**Tools & Techniques:**

**1. Solidity SMTChecker (Built-in)**
```bash
solc --model-checker-engine chc \
     --model-checker-targets overflow,underflow,divByZero \
     Contract.sol
```

**2. Symbolic Execution**
- Explores all possible execution paths
- Tools: [Manticore](https://github.com/trailofbits/manticore), [Mythril](https://github.com/ConsenSys/mythril)

**3. K Framework**
- Formal semantics for EVM
- Used by Runtime Verification for critical protocols

**4. Certora Prover**
- Commercial tool for formal verification
- CVL (Certora Verification Language) for specs

**Resources:**
- [Formal Verification Introduction](https://www.youtube.com/watch?v=izpoxfTSaFs&t=691s)
- [Certora Tutorials](https://www.certora.com/tutorials)

---

#### Mutation Testing

**Purpose:** Validate test quality by introducing deliberate bugs (mutations) to see if tests catch them.

**How it Works:**
1. Modify source code slightly (e.g., change `<` to `<=`)
2. Run test suite
3. If tests pass → gap in test coverage
4. If tests fail → tests adequately protect against this bug type

**Benefits:**
- Identify weak or missing tests
- Focus auditor attention on under-tested areas
- Improve test suite effectiveness

**Tool:** [Necessist](https://github.com/trailofbits/necessist) - automated mutation testing for Rust and Solidity

---

#### Test Types & Best Practices

**Test Hierarchy:**
1. **Unit Tests** - test individual functions in isolation
2. **Integration Tests** - test interactions between contracts
3. **Fork Tests** - test against mainnet state (`forge test --fork-url $RPC_URL`)
4. **Staging Tests** - test on testnets before mainnet

**Best Practices:**
- **[CEI Pattern](https://fravoll.github.io/solidity-patterns/checks_effects_interactions.html)** (Checks-Effects-Interactions) - prevent reentrancy
- **Arrange-Act-Assert** - structure tests clearly
- **Use Modifiers** for [test setup](https://youtu.be/sas02qSFZ74?list=PL4Rj_WH6yLgWe7TxankiqkrkVKXIwOP42&t=4865)
- **Test Negative Cases** - ensure functions revert when they should
- **Simulate Transactions** - `--no-commit` flag simulates without state changes

**Code Coverage:**
- Use `forge coverage` for line/branch coverage
- Use `cloc .` to count lines of code
- Aim for >90% coverage, but coverage ≠ security

**Resources:**
- [Patrick Collins Testing Guide](https://youtu.be/sas02qSFZ74?list=PL4Rj_WH6yLgWe7TxankiqkrkVKXIwOP42&t=1723)
- [Trail of Bits Automated Testing](https://appsec.guide/)
- [Testing Best Practices](https://book.getfoundry.sh/forge/tests)

---

### Bug Bounty Platforms
- [Daily Warden](https://www.dailywarden.com/) - active and upcoming security contests
- [Code4rena](https://code4rena.com/) - competitive audits ([submission policy](https://docs.code4rena.com/roles/wardens/submission-policy))
- [Cantina](https://cantina.xyz/competitions) - private and public competitions
- [CodeHawks](https://www.codehawks.com/) - Cyfrin's audit platform
- [Immunefi](https://immunefi.com/) - largest bug bounty platform for DeFi
- [Remedy](https://hunt.r.xyz/programs) - on-chain bug bounties
- [Sherlock](https://www.sherlock.xyz/) - competitive audits with coverage pool   


-----   

## AI-Assisted Security & Development

### AI Agent Skills
- **[Trail of Bits Skills](https://github.com/trailofbits/skills)** - Claude Code plugin marketplace for security research and vulnerability detection
  - **Smart Contract Security**: Building-secure-contracts toolkit, entry-point analyzer
  - **Code Auditing**: Audit context building, differential review, variant analysis, sharp-edges detection
  - **Verification**: Constant-time analysis, property-based testing, spec-to-code compliance
  - **Static Analysis**: CodeQL, Semgrep rule creator, SARIF parsing
  - **Audit Lifecycle**: Fix review, burpsuite project parsing
  - **Testing**: Testing Handbook skills (fuzzers, sanitizers, coverage tools)
  - License: CC BY-SA 4.0

### Model Context Protocol (MCP) Servers
- **[Slither MCP](https://github.com/crytic/slither)** - MCP server for Slither static analyzer, enables AI assistants to run security analysis

-----   

## DeFi (Decentralized Finance)

**Key concepts:** [`AMM`](#amm) · [`TWAPs`](#twaps-or-time-weighted-average-prices) · [`JIT liquidity`](#jit-just-in-time-liquidity) · [`RFQ`](#rfq-request-for-quote) · [`DLOB`](#dlob-decentralized-limit-order-book) · [`perpetual futures`](#perpetual-futures-perp) · [`observation cardinality`](#observation-cardinality) · [`Slots and epochs`](#slots-and-epochs-ethereum-pos) · [`MEV`](#mev)

### DeFi Analytics & Tracking
- [DeFi Llama](https://defillama.com/) - comprehensive TVL and protocol analytics
- [L2Beat](https://l2beat.com/scaling/tvl) - Layer 2 ecosystem tracking and risk analysis
- [Eigenphi](https://eigenphi.io/) - MEV and on-chain data analytics
- [DeFi vs TradeFi explainer](https://coinstove.com/learn/defi-vs-tradfi/)

### Learning Resources
**DeFi Lending Deep Dives** (3-part series):
- [Part 1: Lending and Borrowing](https://blog.smlxl.io/defi-lending-concepts-part-1-lending-and-borrowing-f646d6a08dd7)
- [Part 2: Liquidations](https://blog.smlxl.io/defi-lending-concepts-part-2-liquidations-7f0f0ffec96c)
- [Part 3: Rewards](https://medium.com/smlxl/defi-lending-concepts-part-3-rewards-2fc87e78e9c4)

- [Teach Yourself Crypto - DeFi Module](https://teachyourselfcrypto.com/#ftoc-module-4-decentralized-finance-defi)
- [Khan Academy - Banking Fundamentals](https://www.khanacademy.org/economics-finance-domain/core-finance/money-and-banking/banking-and-money/v/banking-1)

---

### Decentralized Exchanges (DEXs)

#### Major AMM DEXs

| Protocol | Chain(s) | Type | Key Features | Resources |
|----------|----------|------|--------------|-----------|
| **[Uniswap](https://uniswap.org/)** | Ethereum, L2s | AMM (V4: hooks) | Concentrated liquidity (V3+), flash swaps, TWAP oracles | [Docs](https://docs.uniswap.org/) · [Video](https://www.youtube.com/watch?v=yiG82nHWpSc) |
| **[Curve](https://curve.fi/)** | Multi-chain | Stableswap AMM | Optimized for stables/like-assets, ve-token model, gauges | [Docs](https://curve.readthedocs.io/) · [Video](https://www.youtube.com/watch?v=MqRfurKVM1A) |
| **[Balancer](https://balancer.fi/)** | Ethereum, L2s | Weighted pools | Up to 8 tokens per pool, custom ratios, LBPs | [Docs](https://docs.balancer.fi/) · [Video](https://www.youtube.com/watch?v=IX6rUhNC8uA) |
| **[Aerodrome](https://aerodrome.finance/)** | Base | ve(3,3) | Velodrome fork on Base, vote-escrowed model | [Docs](https://docs.aerodrome.finance/) |
| **[Velodrome](https://velodrome.finance/)** | Optimism | ve(3,3) | Vote-escrowed design, bribe marketplace | [Docs](https://docs.velodrome.finance/) |
| **[PancakeSwap](https://pancakeswap.finance/)** | BSC, multi-chain | AMM + features | Limit orders, perpetuals, lottery, NFTs | [Docs](https://docs.pancakeswap.finance/) · [Video](https://www.youtube.com/watch?v=sr9AKeMa5tU) |
| **[Trader Joe](https://traderjoexyz.com/)** | Avalanche, Arbitrum | Liquidity Book | Discretized liquidity bins, capital efficiency | [Docs](https://docs.traderjoexyz.com/) |
| **[SushiSwap](https://www.sushi.com/)** | Multi-chain | AMM | Cross-chain DEX, concentrated liquidity (V3) | [Docs](https://dev.sushi.com/) · [Video](https://www.youtube.com/watch?v=NTYbVnENeVo) |

#### Order Book DEXs

| Protocol | Chain | Type | Key Features |
|----------|-------|------|--------------|
| **[dYdX V4](https://dydx.exchange/)** | Cosmos app-chain | Orderbook + perps | Fully decentralized orderbook, off-chain matching, on-chain settlement |
| **[Vertex](https://vertexprotocol.com/)** | Arbitrum | Hybrid | Combines AMM + orderbook, integrated perps and spot |
| **[Hyperliquid](https://hyperliquid.xyz/)** | Custom L1 | Orderbook + perps | High-performance L1 for trading, sub-second finality |

#### DEX Aggregators
Route trades across multiple DEXs to find best execution:
- **[1inch](https://1inch.io/)** - pathfinder algorithm, limit orders, gas optimization ([video](https://www.youtube.com/watch?v=BpcP0n44Tf8))
- **[Paraswap](https://www.paraswap.io/)** - multi-path routing, gas refunds
- **[CoW Swap](https://cow.fi/)** - MEV-protected trading via batch auctions and solvers
- **[Matcha](https://matcha.xyz/)** - 0x protocol aggregator

---

### Lending & Borrowing Protocols

| Protocol | Type | Key Features | Resources |
|----------|------|--------------|-----------|
| **[Aave](https://aave.com/)** | Pool-based | Flash loans, isolation mode, eMode, GHO stablecoin, multi-chain | [Docs](https://docs.aave.com/) · [Video](https://www.youtube.com/watch?v=VXlI-uzhBX4) · [Testnet](https://staging.aave.com/) |
| **[Compound](https://compound.finance/)** | Pool-based | Autonomous interest rates, cTokens, governance via COMP | [Docs](https://docs.compound.finance/) · [Video](https://www.youtube.com/watch?v=sIIg2owOz3w) |
| **[Morpho](https://morpho.org/)** | Optimizer | Peer-to-peer matching on top of Aave/Compound, improved rates | [Docs](https://docs.morpho.org/) |
| **[Euler](https://www.euler.finance/)** | Pool-based | Permissionless listing, reactive interest rates, multi-collateral | [Docs](https://docs.euler.finance/) |
| **[Spark](https://spark.fi/)** | Pool-based | MakerDAO's native lending protocol, DAI-focused | [Docs](https://docs.spark.fi/) |
| **[Radiant Capital](https://radiant.capital/)** | Omnichain | Cross-chain lending via LayerZero | [Docs](https://docs.radiant.capital/) |
| **[Fluid](https://fluid.instadapp.io/)** | Smart collateral | Borrow against DeFi positions (Aave, Compound, etc.) | [Docs](https://docs.fluid.instadapp.io/) |

---

### Liquid Staking & Restaking

| Protocol | Type | Token | Key Features |
|----------|------|-------|--------------|
| **[Lido](https://lido.fi/)** | Liquid staking | stETH | Largest ETH staking protocol, ~30% of staked ETH ([video](https://www.youtube.com/watch?v=VQ_uvak1JPw)) |
| **[Rocket Pool](https://rocketpool.net/)** | Liquid staking | rETH | Decentralized node operators, trustless |
| **[EigenLayer](https://www.eigenlayer.xyz/)** | Restaking | - | Restake ETH to secure other protocols (AVSs), additional yield |
| **[Frax Ether](https://frax.finance/)** | Liquid staking | frxETH/sfrxETH | Dual-token system, higher yields via validators |

---

### Derivatives & Perpetuals

| Protocol | Type | Key Features |
|----------|------|--------------|
| **[GMX](https://gmx.io/)** | Perps | Zero-slippage, up to 50x leverage, GLP liquidity pool |
| **[dYdX](https://dydx.exchange/)** | Perps + spot | Decentralized orderbook, off-chain matching |
| **[Synthetix](https://synthetix.io/)** | Synthetic assets | SNX collateral, infinite liquidity, cross-margin perps |
| **[Gains Network](https://gains.trade/)** | Perps | Leverage up to 150x (forex/crypto), DAI collateral |
| **[Hyperliquid](https://hyperliquid.xyz/)** | Perps | High-performance L1, HLP liquidity, sub-second settlement |

**Other Derivatives:**
- **[UMA](https://uma.xyz/)** - optimistic oracle for synthetic assets and insurance
- **[Lyra](https://www.lyra.finance/)** - options trading (calls/puts)
- **[Dopex](https://www.dopex.io/)** - decentralized options

---

### DeFi Key Terms & Concepts

**Financial Metrics:**
- **APY** - [Annual Percentage Yield](https://www.investopedia.com/terms/a/apy.asp) - includes compound interest
- **APR** - Annual Percentage Rate - simple interest without compounding
- **LTV** - [Loan To Value](https://www.investopedia.com/terms/l/loantovalue.asp) ratio - collateral value / loan value (e.g., 75% LTV = borrow $75 with $100 collateral)
- **Health Factor** - ratio of collateral to debt; below 1.0 triggers liquidation (Aave term)
- **Utilization Rate** - percentage of available liquidity currently borrowed
- **PnL** - Profit and Loss

**Participants:**
- **LP** - Liquidity Providers - users who deposit assets into liquidity pools
- **LST** - Liquid Staking Token (e.g., stETH, rETH) - represents staked ETH, remains liquid
- **LRT** - Liquid Restaking Token (e.g., EigenLayer) - represents restaked assets

**Trading Mechanisms:**
- **Order Book Model** - electronic list of buy/sell orders organized by price level, showing market depth at each price point
- **AMM** (Automated Market Maker) - algorithmic market maker using liquidity pools and pricing curves instead of order books
- **CPMM** ([Constant Product Market Maker](https://www.youtube.com/watch?v=QNPyFs8Wybk)) - AMM using formula `x*y=k` (Uniswap V1/V2). When token X supply increases, token Y must decrease to maintain constant k
- **CSMM** - Constant Sum Market Maker (`x+y=k`) - maintains 1:1 price, ideal for like-assets
- **Stableswap** - Hybrid curve (Curve Finance) combining CPMM + CSMM for low-slippage stablecoin swaps
- **Concentrated Liquidity** - LPs provide liquidity within custom price ranges (Uniswap V3+) for improved capital efficiency

**Infrastructure:**
- **Relayer** - off-chain participant that matches orders and facilitates on-chain settlement. Used in:
  - DEX protocols (0x, CoW Protocol) for order matching
  - L2 solutions for transaction batching
  - Cross-chain bridges for message passing
  - Benefits: reduced on-chain storage, lower costs, enhanced liquidity, potential regulatory compliance hooks

**Risk Parameters:**
- **Liquidity Threshold** - minimum liquidity needed for efficient market function and acceptable slippage
  - Defined as collateral:debt ratio or difference
  - Set via governance based on asset volatility
  - Prices determined via oracles in reference currency (ETH, USD, DAI)
- **Liquidation Threshold** - collateral:debt ratio that triggers liquidation (typically 80-85%)
- **Liquidation Penalty** - fee charged during liquidation (typically 5-15%)
- **Kink Parameter** - inflection point in interest rate models (Compound, Aave) where rates shift from linear to exponential growth, typically at optimal utilization (e.g., 80%)

**Token Economics:**
- **Bonding Curve** - mathematical function defining token price based on supply
  - **Reserve Pool**: Holds backing assets (ETH, DAI, etc.)
  - **Pricing Formula**: Determines price from current supply
  - **Mint/Burn Logic**: 
    - Mint: Buy tokens → supply ↑ → price ↑
    - Burn: Sell tokens → supply ↓ → price ↓
  - Used in: token launches, continuous organizations, automated market makers

- **CDP (Collateralized Debt Position)** - accounting unit tracking:
  - Borrowed debt amount
  - Backing collateral value
  - Individual Collateral Ratio (ICR) = collateral value / debt value
  - Used in: MakerDAO, Liquity, other CDP-based protocols

---

### Modern DeFi Trends (2025-2026)

**Real-World Asset (RWA) Tokenization:**
- Tokenization of treasuries, bonds, real estate, commodities on-chain
- Protocols: [Ondo Finance](https://ondo.finance/) (USDY - tokenized treasuries), [Centrifuge](https://centrifuge.io/), [Maple Finance](https://maple.finance/)
- Regulatory clarity improving in US, EU, Singapore, UAE

**Restaking & Shared Security:**
- **[EigenLayer](https://www.eigenlayer.xyz/)** - restake ETH to secure additional protocols (AVSs)
- **[Symbiotic](https://symbiotic.fi/)** - modular restaking protocol
- **[Karak](https://karak.network/)** - multi-asset restaking
- Enables protocols to leverage Ethereum's security without own validator sets

**Intent-Based Architectures:**
- Users express desired outcomes (e.g., "swap X for Y at best price within 5 min")
- Solvers compete to fulfill intents via auctions
- Protocols: [CoW Protocol](https://cow.fi/) (batch auctions), [UniswapX](https://uniswap.org/), [1inch Fusion](https://1inch.io/fusion/)
- Benefits: MEV protection, better execution, gasless transactions

**Account Abstraction (ERC-4337):**
- Smart contract wallets with programmable logic
- Features: social recovery, session keys, gas sponsorship, batched transactions
- Implementations: [Safe](https://safe.global/), [Biconomy](https://www.biconomy.io/), [ZeroDev](https://zerodev.app/)
- EIP-7702 (Pectra upgrade) enables EOAs to temporarily act like smart contracts

**Cross-Chain & Interoperability:**
- Unified liquidity and messaging across chains
- Bridges: [LayerZero](https://layerzero.network/), [Axelar](https://axelar.network/), [Wormhole](https://wormhole.com/)
- Aggregators: [LI.FI](https://li.fi/), [Socket](https://socket.tech/), [Squid](https://www.squidrouter.com/)
- Focus on security post-bridge hacks (Ronin, Poly Network, Wormhole)

**AI + DeFi:**
- AI-powered portfolio management and trading strategies
- Autonomous agents for governance participation
- Automated security monitoring and anomaly detection
- Natural language interfaces for DeFi interactions

**Privacy & Compliance:**
- Zero-knowledge proofs for private transactions
- Selective disclosure for regulatory compliance
- Protocols: [Aztec](https://aztec.network/), [Railgun](https://railgun.org/)
- Balance between privacy rights and AML/KYC requirements

---

### Uniswap Versions 1-4

- **Uniswap V1:**
  - Only ETH/token pairs.
  - Simple constant product (x * y = k) AMM.
  - Minimal design and functionality.

- **Uniswap V2:**
  - Supports ERC20/ERC20 pairs.
  - Introduced flash swaps.
  - Added built-in price oracles and improved LP token functionality.

- **Uniswap V3:**
  - Concentrated liquidity, allowing LPs to specify custom price ranges.
  - Multiple fee tiers for improved capital efficiency.
  - Enhanced customization and capital utilization for liquidity providers.
  - See also: [`JIT liquidity`](#jit-just-in-time-liquidity), [`observation cardinality`](#observation-cardinality), [`TWAPs`](#twaps-or-time-weighted-average-prices)

- **Uniswap V4:**
  - Modular and composable architecture with plug-and-play **hooks**.
  - Further improvements in gas efficiency and capital optimization with ERC-6909
  - More flexible fee structures and integration enhancements.
  - Hooks:  
	- beforeInitialize, afterInitialize
	- beforeAddLiquidity, afterAddLiquidity
	- beforeRemoveLiquidity, afterRemoveLiquidity
	- beforeSwap, afterSwap
	- beforeDonate, afterDonate
	- ERC-6909 (Singleton multi-token standard that stores all positions in a single contract to reduce deployment and transfer costs)
	- Singleton
	- Flash accounting (token debits/credits within a transaction are netted before settlement)
  - See also: [`JIT liquidity`](#jit-just-in-time-liquidity), [`RFQ`](#rfq-request-for-quote), [`DLOB`](#dlob-decentralized-limit-order-book)
 
- [Fuzzing Uniswap V4](https://www.youtube.com/live/CwvD8dmTsRc)
	- Assets vs liabilities, end to end (invariant) at any point A ≥ L (e.g. total value held by the protocol must cover user obligations).
   	- After random sequences of deposits/trades/withdrawals, assert your harness checks assets >= liabilities
- Protocol Phases
	- Genesis: deployment & initial parameters.
	- Operation: normal user flows (deposits, swaps, liquidations).
	- Wind-down: emergency exits, pauses, graceful shutdown.
	- Fuzzing use: target each phase with tailored inputs (e.g. bad init data, stress during run, forced exit).
- Shortcut Functions: helper calls that leapfrog the protocol into complex or edge states to seed fuzzing contexts and accelerate coverage.
- Canary Flaws: small, deliberately injected assertions that should never fire, used to alert you when a fuzzer has reached a dangerous or unexpected path.

---

### DeFi Security & Attack Vectors

**Common DeFi Attack Patterns:**
- **[Slippage Attacks](https://dacian.me/defi-slippage-attacks)** - exploiting insufficient slippage protection in swaps
- **[Block Stuffing](https://www.youtube.com/watch?v=3aPYkx7G7e0)** - filling blocks to prevent liquidation protection ([C4 finding example](https://github.com/code-423n4/2023-05-venus-findings/issues/525))
- **Liquidation Attacks** - forcing undercollateralized positions for profit
- **Price Oracle Manipulation** - flash loan attacks on spot price oracles (see [Stablecoins section](#stablecoins))
- **Reentrancy in DeFi** - read-only reentrancy, cross-function reentrancy
- **JIT Liquidity Sniping** - MEV extraction via just-in-time liquidity provision (Uniswap V3)

**DeFi-Specific Testing:**
- **Invariant Properties to Test:**
  - Assets ≥ Liabilities at all times
  - Total shares × price per share = total assets
  - Sum of user balances ≤ total supply
  - Interest accrual monotonically increases
  - No unauthorized minting/burning

- **Protocol Phase Testing:**
  - Genesis: initialization parameters, admin setup
  - Operation: deposits, withdrawals, swaps, liquidations
  - Wind-down: emergency pause, graceful shutdown, fund recovery

**Practical Resources:**
- **[Build a Liquidation Bot](https://docs.aave.com/faq/liquidations)** ([video walkthrough](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=72020))
- **Aave Architecture** - [decoupling logic from state](https://twitter.com/RareSkills_io/status/1687116196343406594) for upgradability
- **[DeFi Security Best Practices](https://consensys.github.io/smart-contract-best-practices/)** (ConsenSys)   


----- 

### [MEV](https://ethereum.org/en/developers/docs/mev/) 
**Maximal Extractable Value** (formerly "Miner" Extractable Value): the maximum value that can be extracted from block production beyond the standard block reward and gas fees, by including, excluding, or reordering transactions within a block.

#### Modern MEV Architecture (Post-Merge)
After Ethereum's transition to Proof-of-Stake, MEV extraction shifted from miners to validators/block proposers. The ecosystem now operates with **Proposer-Builder Separation (PBS)**:

- **Block Builders**: Specialized actors who construct blocks by ordering transactions to maximize MEV (e.g., sandwich attacks, arbitrage)
- **Block Proposers** (Validators): Choose the most profitable block from builders via [MEV-Boost](https://boost.flashbots.net/) and propose it to the network
- **Searchers**: Identify MEV opportunities and submit bundles to builders
- This separation professionalizes MEV extraction while allowing validators to earn without running sophisticated infrastructure

Per *[Mastering Ethereum (2nd Edition)](https://masteringethereum.xyz/)*, this architecture reduces centralization risks by separating the roles of block construction (builders) and block proposal (validators), while enabling more efficient and competitive MEV markets.

#### Common MEV Attack Types
- **Sandwich Attacks**: Front-run and back-run a victim's transaction to profit from price slippage
- **Front-running**: Submit a transaction with higher gas to execute before a known pending transaction
- **Back-running**: Execute immediately after a target transaction to capitalize on state changes
- **Arbitrage**: Exploit price differences across DEXs or within the same block
- **Liquidations**: Monitor lending protocols to liquidate undercollateralized positions for profit
- **Uncle-block Attack** - **Historical (PoW only)**: Miners could deliberately exclude transactions for uncle blocks. **Note:** Eliminated in Ethereum PoS (post-Merge, Sept 2022)

#### MEV Protection Strategies
- Use **private transactions** via [Flashbots Protect](https://docs.flashbots.net/flashbots-protect/overview) or similar services
- Set **minimum return amounts** with appropriate slippage tolerance in DEX swaps
- Implement **commit-reveal schemes** for sensitive transactions
- Use **MEV-resistant protocols** (e.g., CowSwap, Eden Network)
- Consider **batch auctions** instead of continuous AMMs for large trades
- Monitor the **mempool** for your transactions and adjust gas as needed

#### MEV Resources & Tools
- [Flashbots Documentation](https://docs.flashbots.net/) - comprehensive guide to MEV infrastructure
- [Flashbots Searcher Example](https://github.com/flashbots/searcher-sponsored-tx) - simple searcher for sponsored transactions
- [MEV Bot Templates](https://github.com/solidquant/mev-templates) by Solid Quant
- [Solid Quant Articles](https://medium.com/@solidquant) - MEV strategy deep dives
- [MEV-Share](https://docs.flashbots.net/flashbots-mev-share/overview) - orderflow auction for sharing MEV revenue with users
- [MEV-Explore](https://explore.flashbots.net/) - MEV transaction explorer and analytics
- [EigenPhi](https://eigenphi.io/) - MEV data and analytics platform   

----- 

### Stablecoins

**Overview:** Digital assets designed to maintain a stable value relative to a reference asset (typically USD). [Investopedia guide](https://www.investopedia.com/terms/s/stablecoin.asp) | [Whiteboard Crypto explainer](https://www.youtube.com/watch?v=S7-rfvpEpJs)

#### Types of Stablecoins

**1. Fiat-Collateralized** (Centralized reserves)
- **[USDC](https://www.circle.com/en/usdc)** (Circle) - regulated, audited reserves, ERC-20 and multi-chain
- **[USDT](https://tether.to/)** (Tether) - largest by market cap, multi-chain support, centralized
- **[PYUSD](https://www.paypal.com/us/digital-wallet/manage-money/crypto/pyusd)** (PayPal USD) - regulated fiat-backed stablecoin, launched 2023
- **[USDY](https://ondo.finance/)** (Ondo Finance) - yield-bearing tokenized US Treasuries

**2. Crypto-Collateralized** (Over-collateralized)
- **[DAI](https://makerdao.com/)** (MakerDAO/Sky) - decentralized, backed by crypto collateral (ETH, WBTC, etc.), managed via governance
- **[FRAX](https://frax.finance/)** - hybrid fractional-algorithmic design with collateral backing
- **[sUSD](https://www.synthetix.io/)** (Synthetix) - backed by SNX collateral
- **[LUSD](https://www.liquity.org/)** (Liquity) - immutable, governance-free, backed by ETH

**3. Algorithmic** (No/minimal collateral - **HIGH RISK**)
- **Terra UST** - **FAILED May 2022** ($40B collapse). Death spiral when algorithmic peg broke. Major lesson: algorithmic stablecoins without sufficient backing are fragile.
- Most pure algorithmic designs have failed or been abandoned post-Terra

**4. Synthetic/Delta-Neutral**
- **[USDe](https://www.ethena.fi/)** (Ethena) - synthetic dollar using staked ETH + hedged perpetual futures positions
- Maintains value through delta-neutral strategies rather than direct collateral

#### Stablecoin Design Trade-offs

**[Stablecoin Trilemma](https://www.youtube.com/live/x-3PWe5dAQY?feature=share):** A stablecoin can only achieve 2 of 3:
1. **Decentralization** - no central point of control/failure
2. **Capital Efficiency** - low collateralization ratio
3. **Price Stability** - maintains tight peg

Examples:
- USDC: Capital Efficient, Stable, Centralized
- DAI: Decentralized, Stable,  Capital Inefficient (150%+ collateralization)
- UST (failed): Decentralized, Capital Efficient, Unstable

#### Key Concepts

- **Soft peg** - value maintained within a range (e.g., $0.99-$1.01) rather than exactly $1.00
- **Rebase** - algorithmic supply adjustment (adding tokens to maintain peg)
- **Debase** - algorithmic supply reduction (removing/burning tokens)
- **Seigniorage** - profit from issuing currency (face value minus production cost). In crypto: protocol revenue from stablecoin minting/stability fees
- **Depeg risk** - when a stablecoin loses its peg (USDC briefly hit $0.87 during March 2023 banking crisis)

#### Oracle & Price Manipulation Risks

** Vulnerable Pattern (Spot Price Oracle):**
```solidity
// DON'T DO THIS - single-block price can be manipulated
uint256 price = IUniswapV2Pair(pair).getReserves();
```

**Flash Loan Attack Vector:**
1. Attacker takes flash loan to manipulate AMM pool reserves
2. Protocol reads manipulated spot price from pool
3. Attacker profits from mispriced collateral/liquidations
4. Attacker repays flash loan in same transaction

** Best Practices for Price Oracles:**

1. **Use Time-Weighted Average Price (TWAP)**
   - Uniswap V3: [`observe()`](https://docs.uniswap.org/contracts/v3/reference/core/interfaces/pool/IUniswapV3PoolState#observe) with sufficient `secondsAgo`
   - Minimum 10-30 minute TWAP to prevent single-block manipulation

2. **Use Decentralized Oracle Networks**
   - [Chainlink Price Feeds](https://docs.chain.link/data-feeds) - aggregated data from multiple sources
   - [Chronicle](https://chroniclelabs.org/) - Maker's oracle solution
   - [Pyth Network](https://pyth.network/) - high-frequency price feeds

3. **Multi-Source Price Aggregation**
   - Average prices from multiple DEXs and oracles
   - Implement circuit breakers for price deviation

4. **Observation Cardinality** (Uniswap V3)
   - Increase cardinality for longer TWAP history
   - Check [`slot0.observationCardinality`](https://docs.uniswap.org/contracts/v3/reference/core/interfaces/pool/IUniswapV3PoolState#slot0) before relying on pool oracles

5. **Heartbeat & Staleness Checks**
   - Verify oracle data freshness (e.g., < 1 hour old)
   - Implement fallback price sources

**Resources:**
- [Oracle Manipulation Attacks](https://consensys.github.io/smart-contract-best-practices/attacks/oracle-manipulation/) (ConsenSys Best Practices)
- [Chainlink Oracle Security](https://medium.com/cyfrin/chainlink-oracle-defi-attacks-93b6cb6541bf) - common attack vectors   

----- 

### Finance, Markets & Security Reading

#### Web3 & Smart Contract Security (2024-2025)
- **[Web3 Applications Security and New Security Landscape](https://link.springer.com/book/10.1007/978-3-031-58002-4)** (Ken Huang et al., 2024) - comprehensive coverage of DeFi, NFT, DAO, DEX security; includes quantum threats and AI-related risks
- **[A Comprehensive Guide for Web3 Security](https://link.springer.com/book/10.1007/978-3-031-39288-7)** (Ken Huang et al., 2023) - wallet & smart contract security, oracles, token economics, and legal/regulatory aspects
- **[Get Smart: Building Bulletproof Web3 Smart Contract Applications](https://books.apple.com/us/book/get-smart-building-bulletproof-web3-smart-contract/id6738362998)** (Pete Cox, 2024) - hands-on guide to secure contract development, vulnerability patterns, gas optimization, audit prep
- **[Ultimate Blockchain Security Handbook](https://books.apple.com/us/book/ultimate-blockchain-security-handbook/id6757228354)** (Taha Sajid, 2025) - threat modeling, formal verification, ZK proofs, PKI, auditing practices
- **[Blockchain Technology for Cyber Defense](https://books.apple.com/us/book/blockchain-technology-for-cyber-defense-cybersecurity/id6657986661)** (Naresh Kshetri et al., 2025) - blockchain as cybersecurity tool for zero-trust, ransomware defense

#### Traditional Finance & Market Manipulation (Classic References)
- **[Flash Boys](https://www.amazon.com/Flash-Boys-Michael-Lewis-audiobook/dp/B00ICRE1QC)** (Michael Lewis) - HFT, front-running, and speed advantages in traditional markets (parallels to MEV)
- **[The Big Short](https://www.amazon.com/Big-Short-Inside-Doomsday-Machine-ebook/dp/B003LSTK8G)** (Michael Lewis) - subprime crisis, systemic risk, and market failures
- **[Naked, Short and Greedy: Wall Street's Failure to Deliver](https://www.amazon.com/Naked-Short-Greedy-Streets-Failure/dp/1910151343)** (Susanne Trimbath) - settlement failures, naked short selling, market plumbing issues
- **[Collusion: How Central Bankers Rigged the World](https://www.amazon.com/Collusion-Central-Bankers-Rigged-World/dp/1568585624)** (Nomi Prins) - central bank coordination and market manipulation

#### Market Manipulation Techniques (Traditional & Crypto)
Understanding these traditional finance manipulation tactics helps identify similar patterns in DeFi/MEV:
- **[Quote stuffing](https://en.wikipedia.org/wiki/Quote_stuffing)** - flooding order books with fake orders (similar to gas price manipulation)
- **[Spoofing](https://en.wikipedia.org/wiki/Spoofing_(finance))** - placing fake orders to move prices (crypto equivalent: wash trading, fake liquidity)
- **[Front-running](https://www.investopedia.com/terms/f/frontrunning.asp)** - TradFi version of MEV sandwich attacks
- **[Payment for Order Flow (PFOF)](https://en.wikipedia.org/wiki/Payment_for_order_flow)** - selling trade information (parallels to private mempools/MEV)

#### Financial Regulation & Systemic Risk
- **[Glass-Steagall Act](https://en.wikipedia.org/wiki/Glass%E2%80%93Steagall_legislation)** - separation of investment/commercial banking (lessons for DeFi protocol separation)
- **[Regulation SHO](https://en.wikipedia.org/wiki/Naked_short_selling#Regulation_SHO)** - naked short selling rules (relevant to synthetic assets, flash loans)
- **[Regulatory capture](https://en.wikipedia.org/wiki/Regulatory_capture)** - how industries influence their regulators (important for DAO governance)
     
-----   

### Contract Deployment
- `forge build --vv` - verbose compiling
- `forge build --via-ir --vv` - IR-based compilation; or set `[profile.default] via_ir = true` in foundry.toml
    
-----
### Wallets

**Browser & Mobile Wallets:**
- [Rabby](https://rabby.io/) - multi-chain wallet with DeFi-focused UI, built-in security checks, and transaction pre-execution simulation
- [MetaMask](https://metamask.io/) - most popular Ethereum wallet, browser extension and mobile app
- [Phantom](https://phantom.com/) - self-custodial wallet for Solana and EVM chains, NFT gallery, swap functionality, scam detection
- [Rainbow](https://rainbow.me/) - Ethereum wallet with beautiful UX, built-in swaps, ENS support, NFT showcase
- [Frame](https://frame.sh/) - native desktop wallet with hardware wallet integration, privacy-focused
- [Coinbase Wallet](https://www.coinbase.com/wallet) - self-custodial wallet with dApp browser, supports multiple chains
- [Zerion](https://zerion.io/) - wallet and portfolio tracker with DeFi protocol integrations

**Hardware Wallets:**
- [Ledger](https://www.ledger.com/) - industry-standard hardware wallet (Nano S Plus, Nano X, Stax)
- [Trezor](https://trezor.io/) - open-source hardware wallet with strong security reputation
- [Tangem](https://tangem.com/) - card-style NFC hardware wallet (battery-free), supports 14,000+ assets across 85+ chains
- [SafePal S1](https://www.safepal.com/safepal-s1) - fully offline cold wallet (no USB/WiFi/Bluetooth), affordable
- [GridPlus Lattice1](https://gridplus.io/) - always-online hardware wallet with large touchscreen

**Smart Contract Wallets:**
- [Safe](https://safe.global/) (formerly Gnosis Safe) - multi-sig smart contract wallet for teams and DAOs
- [Argent](https://www.argent.xyz/) - smart contract wallet with social recovery, guardian system
- [Loopring Wallet](https://wallet.loopring.io/) - zkRollup L2 wallet with low fees and built-in DEX

**Bitcoin-Focused:**
- [Bitkey](https://bitkey.world/) - multisig self-custody by Block, Inc. (mobile + hardware + recovery)
- [Sparrow](https://sparrowwallet.com/) - Bitcoin-only desktop wallet for advanced users, hardware wallet integration

-----
## Teams to Connect With  
- [Chainalysis](https://www.chainalysis.com/)
- [Chainlink](https://chain.link/)   
- [Consensys](https://consensys.net/about/)   
- [Cyfrin](https://www.cyfrin.io/)   
- [Secureum](https://www.secureum.xyz/)      
- [Spearbit](https://spearbit.com/)  
- [Trail of Bits](https://www.trailofbits.com/)  
- [Zellic](https://www.zellic.io/)

-----
## Jobs
- [CryptoJobList](https://cryptojobslist.com/solidity?sort=recent)   
- [Arbitrum](https://jobs.arbitrum.io/jobs)
- [Bankless](https://bankless.pallet.com/jobs)   
  
-----  
 
## Abstracts: In Depth Understanding
Bitcoin [whitepaper](https://bitcoin.org/bitcoin.pdf)     
Ethereum [whitepaper](https://ethereum.org/en/whitepaper/) (periodically updated)   
Uniswap V3 [whitepaper](https://uniswap.org/whitepaper-v3.pdf)      

[Improving the Efficiency and Reliability of Digital Time-Stamping](http://math.columbia.edu/~bayer/papers/Timestamp_BHS93.pdf)       
[Secure Names for Bit-Strings](https://nakamotoinstitute.org/static/docs/secure-names-bit-strings.pdf)      
[Anonymous Payments Lecture](https://www.youtube.com/watch?v=Z0s4W3UBxM8)
[Academic Smart_Contract_Papers](https://github.com/hzysvilla/Academic_Smart_Contract_Papers)    

----- 
  
## Tokens
Ethereum Request for Comment (ERC)

* [ERC-20](https://ethereum.org/en/developers/docs/standards/tokens/erc-20/) - for fungible assets. 
* [ERC-721](https://docs.openzeppelin.com/contracts/2.x/api/token/erc721) - for non-fungible assets.
* [ERC-1155](https://ethereum.org/en/developers/docs/standards/tokens/erc-1155/) - Multi Token Standard to to create fungibility-agnostic and gas-efficient token contract (gaming, batch minting, batch balance; batch transfer, batch approve) [video](https://www.youtube.com/watch?v=Ai7A-_umm08)   
* [ERC-2612](https://eips.ethereum.org/EIPS/eip-2612) - Permit extension for ERC-20 tokens, enabling gasless approvals via off-chain signatures (no transaction needed for approve())
* [ERC-4626](https://ethereum.org/en/developers/docs/standards/tokens/erc-4626/) - to optimize and unify the technical parameters of yield-bearing vaults
* [ERC-3156](https://eips.ethereum.org/EIPS/eip-3156) - flash Loans  
* ERC-918 - Mineable Token Standard.
* ERC-165 - standard method to publish and detect what interfaces a smart contract implements.
* ERC-725 - interface for a simple proxy account.
* ERC-173 - interface for ownership of contracts.  
* [ERC-2981](https://eips.ethereum.org/EIPS/eip-2981) - to retrieve royalty payment information across all NFT marketplaces and ecosystem participants
* [ERC-1167](https://eips.ethereum.org/EIPS/eip-1167) - Minimal Proxy Contract to simply and cheaply clone contract functionality in an immutable way   

NFT's and Atomic NFT's [lecture](https://youtu.be/tVyS3Ut_1eE?t=2535) with Ari Juels of whom with Sergey Nazarov co-authored a white paper introducing the [Chainlink](https://en.wikipedia.org/wiki/Chainlink_(blockchain)) protocol.   

-----  

## Dictionary of Key Terms (Solidity) 
###### Broader [Crypto dictionary](https://coinmarketcap.com/alexandria/glossary) of terms or [General](https://medium.datadriveninvestor.com/crypto-vocabulary-expanded-76131d26537b)    

`63/64 rule of EIP-150` - to prevent denial-of-service attacks involving deep call stacks in Ethereum:
    * ensures when calling another contract using CALL, DELEGATECALL, or similar opcodes, the calling contract can only pass at most 63/64ths (about 98.4%) of its remaining gas to the called contract.
    * This guarantees the calling contract always retains a small portion (at least 1/64th) of its gas, allowing for safe termination and error handling, mitigating out-of-gas attacks.    

 `Aave` - decentralised non-custodial liquidity market protocol where users can participate as suppliers or borrowers. Suppliers provide liquidity to the market to earn a passive income, while borrowers are able to borrow in an overcollateralised (perpetually) or undercollateralised (one-block liquidity) fashion; Stani Kulechov [interview](https://www.youtube.com/watch?v=PA9QrrH-ze0) by Haseeb Qureshi -- [Aave website](https://app.aave.com/)    

`ABI` - application binary interface specifies set of functions that can be accessed outside of smart contract; similar to a JSON; Abi.encodePacked - breaks down, via [cheatsheet](https://docs.soliditylang.org/en/latest/cheatsheet.html); [Abi.decode](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=81282); Great Patrick Collins section [22:16:31](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=80191) and [ABI encoding](https://youtu.be/sas02qSFZ74?list=PL4Rj_WH6yLgWe7TxankiqkrkVKXIwOP42&t=30003) and [difference between encoding](https://forum.openzeppelin.com/t/difference-between-abi-encodepacked-string-and-bytes-string/11837)   
 - [Xdeadbeefx blog: The Double-Edged Sword of abi.decode](https://medium.com/@0xdeadbeef0x/the-double-edged-sword-of-abi-decode-f81529e62bcc)  

`address` - (Ethereum; other blockchains will be different) 42-character hexadecimal address derived from the last 20 bytes of the public key controlling the account with 0x appended in front `0x0cE446255506E92DF41614C46F1d6df9Cc969183`      

`Air state` - algebraic intermediate representation: In zero-knowledge proofs (ZKPs), particularly in STARKs (Scalable Transparent Argument of Knowledge), AIR is a mathematical framework used to describe computations in a way that can be efficiently verified; It defines a set of constraints that an execution trace must satisfy.    

[airdrop](https://www.coindesk.com/learn/what-is-a-crypto-airdrop/) - involve blockchain-based projects and developers sending out free tokens to members of their communities as part of a broader marketing initiative.    

`Alpha` - in finance it refers to excess return of an investment relative to the return of a benchmark index   

<a id="amm"></a>
[AMM](https://www.youtube.com/watch?v=1PbZMudPP5E) - Automated Market Maker; underlying protocol that powers all decentralized exchanges (DEXs), DEXs help users exchange cryptocurrencies by connecting users directly, without an intermediary; autonomous trading mechanisms that eliminate the need for centralized exchanges; drawback: susceptible to front running because of publicity in mempool    

`Anti-Patterns` - common coding practices or design patterns in smart contract development that lead to insecure, inefficient, or unmaintainable code.
**Common Examples:**
- **Reentrancy Vulnerability:**  
  Failing to follow the Checks-Effects-Interactions pattern, enabling malicious reentrant calls.
- **Using `tx.origin` for Authentication:**  
  Relying on `tx.origin` instead of `msg.sender` to validate callers, which can be exploited by phishing attacks.
- **Unbounded Loops:**  
  Implementing loops without proper limits, risking excessive gas consumption and transaction failure.
- **Direct Ether Transfers Without Checks:**  
  Using methods like `transfer` or `call` without proper error handling, which may lead to lost funds.
- **Lack of Input Validation:**  
  Not validating inputs or state, leading to unexpected behavior or vulnerabilities.
- **Hardcoding Critical Values:**  
  Embedding constants in code that should be configurable, reducing flexibility and increasing risk.
- **Overly Complex Inheritance:**  
  Using deep or circular inheritance structures that complicate auditing and increase error risk.
- **Improper Use of Libraries:**  
  Not leveraging safe math libraries (or relying on outdated versions), leading to potential overflows/underflows.

`Application-specific integrated circuit (ASIC)` - specialized hardware designed for a specific task. In crypto, ASICs were used for PoW mining (Bitcoin still uses them). **Note:** Ethereum transitioned to Proof-of-Stake in September 2022 (The Merge), so ASIC/GPU mining no longer applies to Ethereum.    

`arrays` - fixed [2] length of 2 elements and dynamic [] arrays with no fixed size; can also create an array of structs or 2D array     

`assertEQ` - Assert a is [equal](https://book.getfoundry.sh/reference/forge-std/assertEq) to b    

[atomic swap](https://www.investopedia.com/terms/a/atomic-swaps.asp) - an exchange of cryptocurrencies from separate blockchains; the term "atomic state" in which a state has no substates; it either happens or it doesn't—there is no other alternative. 

[Beacon Chain](https://ethereum.org/en/roadmap/beacon-chain/) -  introduced proof-of-stake to the Ethereum ecosystem; was a [separate chain](https://www.alchemy.com/overviews/what-is-the-ethereum-beacon-chain) from the original Ethereum Mainnet, running side-by-side that merged with the original Ethereum proof-of-work chain in September 2022; [withdrawals](https://ethereum.org/en/staking/withdrawals/)   

`Beacon in Proxies`  - a beacon is a contract that provides the implementation address for proxies, allowing multiple proxies to upgrade their logic by just updating the beacon.

`Black Thursday` [article](https://decrypt.co/61200/bitcoin-black-thursday-one-year-later) - Thursday March 12th, 2020: cryptocurrency markets suddenly collapsed (in tandem with traditional markets), with bitcoin prices getting halved in less than a day.   

`blob` - introduced in Dencun (EIP-4844, March 2024) for L2 data availability. Binary large objects (~125 KB each) attached to transactions, stored temporarily (~18 days) rather than permanently. Much cheaper than calldata for rollup data posting (~10-100x cost reduction). Uses separate fee market with `blob_base_fee` (EIP-1559 style pricing). Pectra increased blob throughput (3→6 target per block, 3→9 max); Fusaka adds PeerDAS for further scaling. Key for Ethereum's rollup-centric roadmap.   

`block.timestamp` - convert a uint of the number of seconds in that length of time. So 1 minutes is 60, 1 hours is 3600 (60 seconds x 60 minutes), 1 days is 86400 (24 hours x 60 minutes x 60 seconds), find on [cheatsheet](https://docs.soliditylang.org/en/latest/cheatsheet.html)    

`bridges` - a blockchain [bridge](https://blog.makerdao.com/what-are-blockchain-bridges-and-why-are-they-important-for-defi/): and [Youtube](https://www.youtube.com/watch?v=xS0PyYpt6bA) connects two blockchain ecosystems. Bridges facilitate communication between blockchains through the transfer of information and assets.   

`bridge loan` - short-term loan allowing users to temporarily borrow funds (often stablecoins or major crypto assets) while awaiting other liquidity sources, such as the settlement of cross-chain asset transfers, DeFi protocol withdrawals, or yield farming returns.

`Byzantine fault` or [Byzantine generals problem](https://en.wikipedia.org/wiki/Byzantine_fault) - a condition of a computer system, particularly distributed computing systems, where components may fail and there is imperfect information on whether a component has failed; thus the reason for Proof of Work  

`CFMM` - Constant Function Market Makers: [article](https://medium.com/bollinger-investment-group/constant-function-market-makers-defis-zero-to-one-innovation-968f77022159)   

`clustering` - tracing bitcoin via blockchain analysis; tracing Bitcoin user wallets by tracking wallet “change” creation; using tags; peel chains [How to Peel a Million: Validating and Expanding Bitcoin Clusters](https://arxiv.org/pdf/2205.13882.pdf) Sarah Meiklejohn and team; also [A Fistful of Bitcoins: Characterizing Payments Among Men with No Names](https://cseweb.ucsd.edu/~smeiklejohn/files/imc13.pdf)   

`codecopy` - copying code from one place to another is handled by the `opcode` codecopy, [see article](https://medium.com/coinmonks/ethernaut-lvl-19-magicnumber-walkthrough-how-to-deploy-contracts-using-raw-assembly-opcodes-c50edb0f71a2)   

`Compound` - a DeFi lending protocol that allows users to earn interest on their cryptocurrencies by depositing them into one of several pools      

`coinbase transaction` - in PoW chains (e.g., Bitcoin), the first transaction in a block where miners collect the block reward and fees. **Note:** Ethereum (post-Merge, Sept 2022) uses PoS; validators receive rewards via the consensus layer. The term `block.coinbase` in Solidity now refers to the fee recipient address set by the block proposer.

`concentrated liquidity` - liquidity placed within a chosen price range (e.g., Uniswap v3). Improves capital efficiency but introduces range selection, rebalancing, and fee-capture timing risks (see [`JIT`](#jit-just-in-time-liquidity)).

`commit-reveal scheme` - two-step process where users first commit to a choice without revealing it. Later, they reveal their choice. This prevents others from seeing the original choice until the reveal stage. Used for voting, random number generation, etc.   
	- Rock-Paper-Scissors Game Design: Use a commit-reveal scheme. Players first commit (send hash of their choice + secret) and then reveal in the next step.   

`constant` - naming convention ALL_CAPS; more `gas efficient`   

`constructor` - called once when contract is deployed
	- [intitialize function](https://stackoverflow.com/questions/72475214/solidity-why-use-initialize-function-instead-of-constructor) : The contract’s constructor is automatically called during contract deployment.But this is no longer possible when proxies are in play, as the constructor would change only the implementation contract’s storage (Contract B), not the storage of the proxy contract (Contract A), which is the one that matters. Therefore, an additional step is required. We need to change the constructor in a regular function. This function is conventionally called initialize or init, this function will be called on the proxy contract once both contracts have been published, so as to save all changes of state on the proxy contract (contract A) and not on the implementation (contract B)

`creation code` - only executed by the EVM once during the transaction that creates the contract.  gets executed in a transaction, which returns a copy of the runtime code, which is the actual code of the contract. The contract’s constructor is part of the creation code; it will not be present in the contract’s code once it is deployed.   

[custom errors](https://soliditylang.org/blog/2021/04/21/custom-errors/) - declared at top, more `gas efficient`    

`DAI` - stablecoin on the Ethereum blockchain whose value is pegged to $US   

`dark forest` - “all people with nodes on major blockchains grinding on mempool transactions” - 9:40 [Andrew Miller AMA](https://www.youtube.com/watch?v=IwRfEsX07MU) and later mentions [David Chaum](https://en.wikipedia.org/wiki/David_Chaum) Dan Robinson’s [blog post](https://www.paradigm.xyz/2020/08/ethereum-is-a-dark-forest)    

`data Locations` - Storage, Memory and Calldata
  1. storage - variable is a state variable (store on blockchain)
  2. memory - variable is in memory and it exists while a function is being called
  3. calldata - originates as part of the transaction payload sent to the blockchain. When a transaction is broadcasted, the calldata is included in the transaction and passed to the EVM upon execution. It is stored in the RLP-encoded transaction on-chain, accessible only during execution. resides in a virtualized region of the EVM's memory that behaves similarly to other stack-based memory structures. It exists only during the execution of the transaction and is discarded immediately after the transaction ends. (Special data location that contains function arguments): [decoding calldata](https://youtu.be/sas02qSFZ74?t=38028)
  	- Cost for setting a storage slot from zero to non-zero (higher gas cost).  
     	- Cost for modifying a storage slot that is already non-zero (medium gas cost).
     	- CALLDATALOAD: Loads 32 bytes of calldata starting at a specific offset.
     	- CALLDATACOPY: Copies a segment of calldata to memory.
     	- CALLDATASIZE: Returns the total size of the calldata.

`delegatcall` - identical to a message call apart from the fact that the code at the target address is executed in the context; a contract can dynamically load code from a different address at runtime. Storage, current address and balance still refer to the calling contract, only the code is taken from the called address. Pattick Collins explanation [1:05:07:37](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=104857); [shorter video](https://www.youtube.com/watch?v=uawCDnxFJ-0)      

`describe ()` - function in [Jasmine](https://stackoverflow.com/questions/12209582/the-describe-keyword-in-javascript) framework used for testing   

`deterministic algorithm` - an [algorithm](https://en.wikipedia.org/wiki/Deterministic_algorithm) that, given a particular input, will always produce the same output, with the underlying machine always passing through the same sequence of states  

`DLOB (Decentralized Limit Order Book)` - an order book where makers post price/size quotes and takers match against them. Storage/matching can be fully on-chain or hybrid (off-chain relayers with on-chain settlement). Enables price-time priority and advanced order types; examples include Serum/OpenBook-style systems.

`Discrete Log Contracts (DLCs)` - blockchain-based protocols used to create secure and private smart contracts that rely on real-world events or off-chain data, without needing to trust a single oracle. They were initially proposed by Thaddeus Dryja, co-author of the Lightning Network paper.    
 - Transaction details remain private, as only contract participants and oracles know the details.
 - Oracles can't manipulate or even know how their data is used. Parties don't need to trust an oracle fully—just their honesty in publishing data.
 - DLCs scale well since most interactions occur off-chain. Blockchain is primarily used for settlement.
 
`dutch auction` - a descending price auction; an auctioneer starts with a very high price, incrementally lowering the price until someone places a bid   

`elliptic curve` - [elliptic curve cryptography](https://medium.com/coinmonks/learn-how-to-code-elliptic-curve-cryptography-a952dfdc20ab) with fastecdsa library; also OZ's [ECDSA](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/ECDSA.sol) - Elliptic Curve Digital Signature Algorithm (ECDSA) operations used to verify a message was signed by the holder of the private keys of a given address.   
  
`enums` - useful to model choice and keep track of state/can be declared outside of a contract   

`ENS - Ethereum Name Service` -  distributed, open, and extensible naming system based on the Ethereum blockchain; [documents](https://docs.ens.domains/) and [video](https://www.youtube.com/watch?v=P8RlPsjGaR8)   

`EIP` - (Ethereum Improvement Proposal) a formal proposal to alter some element of the Ethereum network

`EIP-7702` - introduced in the Pectra upgrade (May 2025), enables EOAs to temporarily act like smart contract accounts for specific transactions via a new type-4 transaction. Users sign an off-chain authorization specifying a delegate contract; the EOA's behavior temporarily becomes that of the delegate. Enables transaction batching, gas sponsorship, passkey authentication, and spending limits without requiring a new address.
   - **Security risks:** Phishing attacks where users are tricked into signing malicious delegation authorizations; replay/cross-chain risks; dependency on trusted delegate contracts.
   - **Best practices:** Only delegate to audited contracts; inspect nonces and chain IDs; use simulation tools; keep bulk assets in non-delegated EOAs.   

<a id="erc-4626-tokenized-vault-standard"></a>
`ERC-4626 (Tokenized Vault Standard)` - standard interface for tokenized vaults. Auditing checks: preview/mint/redeem alignment, rounding direction (user-favorable), share:asset ratio monotonicity, fee accrual and share dilution correctness, totalAssets consistency, edge cases on zero/first depositor.

`EOA` - Externally Owned Account; controlled by private keys (vs. contract accounts controlled by code). Post-Pectra (May 2025), EOAs can temporarily delegate to smart contract logic via EIP-7702, enabling features like batching, gas sponsorship, and passkeys while retaining the same address. This blurs the traditional EOA vs. contract account distinction. **Note:** EIP-4337 provides smart contract-based account abstraction (active since 2023) using UserOperation objects and paymasters; EIP-7702 enables native protocol-level EOA delegation.   

`events` - allow logging to the Ethereum blockchain; Use cases for events are: Listening for events and updating user interface; cheap form of storage 
	- Anonymous Solidity Event - does not store its signature in the topics list of the log. Instead, only the arguments are stored.

`EVM` - Ethereum is a stack based architecture, single threaded.   

`factory contract` - a smart contract that deploys and manages other contracts. It acts as a blueprint for creating multiple instances of a contract dynamically on-chain.

`fallback` - special function executed either when a function that does not exist is called or Ether is sent directly to a contract but receive() does not exist or msg.data is not empty; fallback has a 2300 gas limit when called by transfer or send    

`flattened contract` - taking a contract that uses import statements and merging it with all of its dependencies into a single .sol file, with no imports remaining; use the solidity-flattener or [forge-flatten](https://book.getfoundry.sh/reference/forge/forge-flatten#forge-flatten): Example: `forge flatten src/MyContract.sol --output out/Flat.sol`

`flashbots` - [independent project](https://ethereum.org/en/developers/docs/mev/) which extends execution clients with a service allowing searchers to submit MEV transactions to validators without revealing them to the public mempool; prevents transactions from being frontrun by generalized frontrunners; [video](https://www.youtube.com/watch?v=Zt15wrSDVxc)  
   - How to build [flashbots](https://www.youtube.com/watch?v=gme0uNyIIsE)

`flash loan` - a smart contract transaction in which a lender smart contract lends assets to a borrower smart contract with the condition that the assets are returned, plus an optional fee, before the end of the transaction. This ERC specifies interfaces for lenders to accept flash loan requests, and for borrowers to take temporary control of the transaction within the lender execution. The process for the safe execution of flash loans is also specified.

`flash-swap` - all trades must occur during single transaction: opportunity for arbitragers   

`floating point arithmetic` - Solidity doesn't support floating point arithmetic natively due to the deterministic nature of the Ethereum Virtual Machine (EVM). Floating point operations can lead to imprecise calculations, which are not suitable for financial operations on a blockchain where exactness is paramount. However, developers can use fixed-point arithmetic libraries to achieve decimal-like precision.   

`flooding` - [routing](https://en.wikipedia.org/wiki/Flooding_%28computer_networking%29)   

`fork` - a radical change to a network's protocol that makes previously invalid blocks and transactions valid, or vice-versa. A hard fork requires all nodes to upgrade.

**Ethereum Upgrade Timeline (recent):**
- **Pectra** (May 7, 2025): Prague + Electra. Key EIPs: EIP-7702 (EOA account abstraction), EIP-7251 (validator max balance to 2048 ETH), EIP-6110 (faster deposits), EIP-7691 (blob throughput increase 3→6 target), EIP-2537 (BLS12-381 precompile).
- **Fusaka** (Dec 3, 2025): Fulu + Osaka. Key EIPs: EIP-7594 (PeerDAS for data availability sampling), EIP-7935 (60M block gas limit), EIP-7825 (16.7M tx gas cap), EIP-7951 (secp256r1/P-256 precompile for WebAuthn), EIP-7939 (CLZ opcode). BPO forks follow for incremental blob scaling.
- **Dencun** (Mar 2024): Introduced blobs (EIP-4844) for L2 data availability, `TSTORE`/`TLOAD` transient storage (EIP-1153), `MCOPY` opcode (EIP-5656), `BLOBHASH` opcode, deprecated `SELFDESTRUCT` (EIP-6780).
- **Shanghai** (Apr 2023): Enabled staking withdrawals post-Merge, added `PUSH0` opcode (EIP-3855).    

`function selector` - first 4 bytes of the function signature: ex: 0xa9059cbb; excellent Patrick Collins section [22:46:43](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=82003); [shorter video](https://www.youtube.com/watch?v=Mn4e4w8h6n8); there can be function selector clashes   
`function signature` - string that defines function name & parameters: ex: “transfer(address, uint256)”   

[visibility specifiers](https://docs.soliditylang.org/en/latest/cheatsheet.html#:~:text=Type%20Information.-,Function%20Visibility%20Specifiers,%EF%83%81,-open%20in%20Remix) 
 - `public` makes the function callable from any contract. If no visibility is specified for a function, it defaults to public.
 - `external` makes the function callable only from other contracts. These functions are often used for interactions between contracts. Note that they cannot be called internally, i.e., from within the same contract.
 - `private` makes the function callable only from within the contract where it is defined.
 - `internal` makes the function callable only from within the contract where it is defined, or from contracts that derive from it (i.e., contracts that inherit from it).
 - `view` used for functions that do  not alter the state of the contract (i.e., they don't change any state variables).
 - `pure` used for functions that not only do not alter the state of the contract, but also do not access any data in the contract. These functions solely operate on their input parameters.
 - `payable` allows a function to receive Ether together with a call. If a function is not marked payable, it will reject any Ether sent to it.
 - Public `state variables` automatically generate getter functions.   

`fuzzing` - or fuzz testing involves providing invalid, unexpected, or random data as inputs in an attempt to break/crash the system   

`gas` - transactions with higher gas price have higher priority to be included in a block;   

 `genesis block`- the first block mined on a [blockchain](https://www.investopedia.com/terms/g/genesis-block.asp)     

 [Graph, The](https://www.youtube.com/watch?v=7gC7xJ_98r8) - Google for the blockchain; querying and indexing the blockchain    

 `griefing` - malicious/trollish behavior where an actor intentionally disrupts or harms the user experience without benefit to themselves   

`hashcash` - a proof-of-work system invented by Adam Back in 1997 as a way to prevent email spam [precursor to Bitcoin](https://nakamoto.com/hashcash/)   

`Hashed Timelock Contract` or (HTLC) reduces counterparty risk by creating a time-based escrow that requires a cryptographic passphrase for unlocking via [investopedia](https://www.investopedia.com/terms/h/hashed-timelock-contract.asp)    

[heartbeat, oracle](https://docs.chain.link/data-feeds/price-feeds/addresses/?network=ethereum) click show more details - refers to an oracle providing regular updates at fixed intervals   

`hooks (Uniswap v4)` - callback contracts invoked before/after core pool actions (initialize, add/remove liquidity, swap, donate). Risks: reentrancy, griefing via reverts, gas bombs, and price manipulation through callbacks. Require strict ordering, access control, limits, and integration tests.

`Howey Test` - refers to the U.S. Supreme Court [case](https://www.investopedia.com/terms/h/howey-test.asp) for determining whether a transaction qualifies as an "investment contract," and therefore would be considered a security; (per Infinite Machine Chp. White-Shoe Lawyers) Ether presale was classified as a utility, a function of ethereum and therefore not a security; manner distribution of a product and not as a speculative investment; essentially a utility token   

`immutable` - can be set inside the constructor but cannot be modified afterwards, more `gas efficient`: `i_owner` - i meaning immutable   

`impermanent loss` - a temporary loss of funds occurring when providing liquidity; occurs when the mathematical formula adjusts the asset ratio in a pool to ensure they remain at 50:50 in terms of value and the liquidity provider loses out on gains from a deposited asset that outperforms; [whiteboard crypto video](https://www.youtube.com/watch?v=_m6Mowq3Ptk)   

`interface` - a list of function definitions without implementation. In other words, an interface is a description of all functions that an object must have for it to operate; convention preface `I` as in IERC721; [video](https://www.youtube.com/watch?v=tbjyc-VQaQo)   

`internal` - can't be called directly from outside the contract; same as private, except it's accessible to contracts that inherit  

`intents` - users express desired outcomes (e.g., "swap X for Y at best price") rather than specific transactions. Solvers/routers fulfill intents via auctions or matching (e.g., CoW Protocol). Security/MEV implications: solver incentives, fair routing, and replay/manipulation resistance of signed intents.

`interoperability` - the ability of independent distributed ledger networks to communicate with each other, exchange and make use of data; ability to move a digital asset between two or more blockchains while maintaining the state and uniqueness of the asset consistent throughout the process    

`invariant` - [invariant](https://en.wikipedia.org/wiki/Class_invariant) a computer programming construct consisting of a set of invariant properties that remain uncompromised regardless of the state of the object; a property of a system that should always hold   
   - Stateless fuzzing: where the state of the previous run is discarded for every new run   
   - Stateful fuzzing: fuzzing where final state of previous run is the starting state of the next run   

`IPFS` - InterPlanetary File System [(IPFS)](https://docs.ipfs.tech/) a set of composable, peer-to-peer protocols for addressing, routing, and transferring content-addressed data in a decentralized file system; see also [Swarm](https://www.ethswarm.org/)      

`it()` - defined by the jasmine [testing framework](https://stackoverflow.com/questions/28353232/what-is-the-it-function-here-doing), to declare the expected output and have a fair check if it matches the coded conditions    

`import path resolution` - name [import](https://docs.soliditylang.org/en/latest/path-resolution.html)

`JIT (Just-In-Time liquidity)` - in concentrated-liquidity AMMs (e.g., Uniswap v3/v4), LPs add liquidity only for the block/ticks of a large swap to capture fees, then remove it immediately. A timing/game-theory tactic; Uniswap v4 hooks can penalize/reshape this behavior.

`Keccak256` - [SHA-3](https://en.wikipedia.org/wiki/SHA-3)/Secure Hash Algorithm; using it in a [contract](https://www.youtube.com/watch?v=wCD3fOlsGc4)  

`Know Your Customer` or KYC - guidelines and regulations in financial services that require professionals to verify the identity, suitability, and risks involved with maintaining a business relationship with a customer; providing documents AML (anti money laundering)    

`layer 0` - the underlying infrastructure upon which multiple Layer 1 blockchains can be built; a network framework running beneath the blockchain. It is made up of protocols, connections, hardware, validators/nodes, and more that forms the foundation of the blockchain ecosystem. Layer: 0, 1, 2, 3 etc.   
   
`linting` - the process of running a program that will analyze code for potential errors (verifying code quality) [eslint](https://eslint.org/)   

[liquidity pool](https://www.youtube.com/watch?v=dVJzcFDo498) - a smart contract containing large portions of cryptocurrency, digital assets, tokens, or virtual coins locked up and ready to provide essential liquidity for networks that facilitate decentralized trading

`LVR (Loss Versus Rebalancing)` - measure of LP underperformance vs a continuously rebalanced reference portfolio due to adverse selection and backrunning. Used to evaluate AMM design and fee tiers; impacted by oracle quality, latency, and liquidity-timing strategies like JIT.

`magic number` [wiki](https://en.wikipedia.org/wiki/Magic_number_(programming)) unique value with unexplained meaning or multiple occurrences which could (preferably) be replaced with a named constant   

`memepool` - or [memory pool](https://www.alchemy.com/overviews/what-is-a-mempool) is a dynamic staging area in front of the blockchain that enables transaction ordering, fee prioritization, and general block construction; a list of pending transactions waiting for validation from a node before it is committed to a block on the blockchain   

`meta-transactions` - a transaction without the end-user directly paying for gas: users sign transactions off-chain, and a third-party service called a relayer submits the transaction to the blockchain, paying gas on the user's behalf    

`MEV` - maximal (formerly miner) extractable value; referred to as an "invisible tax" that can be extracted from block production. In modern Ethereum (post-Merge), MEV extraction involves **Proposer-Builder Separation**: specialized **block builders** construct optimal blocks to maximize MEV, while **validators** (proposers) select and propose the most profitable block. This separates the complex work of MEV extraction from validation duties, allowing validators to earn MEV rewards without sophisticated infrastructure. See [MEV section](#mev) for details; [video](https://youtu.be/u4sV-Btg1Ag)   

`mocking`- creating objects that simulate the behaviour of real objects; primarily used in unit testing; [Patrick Collins mocks](https://youtu.be/sas02qSFZ74?t=2553)    
 
`modifier` - `_;` check requirements prior to execution code that can be run before and/or after a function call
  1. Restrict access
  2. Validate inputs
  3. Guard against reentrancy hack   
  
`msg.sender` - there will always be a msg.sender; one who call contract  

`musked` - refers to the transaction payload being obfuscated or spoofed (always verify transactions at the smart contract data level, not just UI)

[Named imports](https://youtu.be/umepbfKp5rI?t=13460)    

`NatSpec` - Ethereum Natural Language Specification [Format](https://docs.soliditylang.org/en/v0.8.19/natspec-format.html) @title and @author are straightforward; @notice explains the contract function does; @dev is for explaining extra details to developers; @param and @return are for describing what each parameter and return value of a function are for  

`Nick Szabo` - [Nick Szabo](https://en.wikipedia.org/wiki/Nick_Szabo) coined the phrase and concept of "smart contracts"   

`node` - blockchains are decentralized, immutable, digital ledgers shared across a peer-to-peer network. Acting as a database, transaction data is permanently recorded, stored and encrypted onto the “blocks” that are then “chained” together. The physical, electronic devices (a computer, typically) that maintain copies of the chains webbing a network together, keeping the blockchain operational, are called [nodes](https://builtin.com/blockchain/blockchain-node) 
- lightweight nodes - are downloaded wallets connected to full nodes for validating the data stored on the blockchain. Simple Payment Verification (SPV) node or lightweight node is used in day-to-day crypto operations.   
  
`nonce` - transaction code for this account starting with 0; makes transactions unique; important regarding concurrency; If the account is an externally owned account, this number represents the number of transactions sent from the account’s address. If the account is a contract account, the nonce is the number of contracts created by the account; [short video](https://youtu.be/EOgpr73-pgc)    

`observation cardinality` - the capacity (number of stored samples) in an AMM pool’s oracle ring buffer used for TWAPs (e.g., Uniswap). Higher cardinality ⇒ more samples/longer, smoother TWAPs with extra storage/gas; too low ⇒ easier to bias/short windows.

`Omner blocks` - **Historical (PoW only)**: previously called Uncle blocks, it was possible for two blocks to be created simultaneously by a network. When this happened, one block would be left out. This leftover block was called an ommer block, referring to the familial relationships used to describe block positions within a blockchain. **Note:** Ethereum's Proof-of-Stake consensus (post-Merge, Sept 2022) eliminated uncle/ommer blocks; PoS uses a slot-based system where only one proposer per slot can create a block  

`Opcode` - operation code; the portion of a machine language instruction that specifies the operation to be performed; see gas [Opcode](https://github.com/crytic/evm-opcodes)   

`oracle` - entities that connect blockchains to external systems, thereby enabling smart contracts to execute based upon inputs and outputs from the real world; a way for the decentralized ecosystem to access existing data sources, legacy systems, and advanced computations (blockchain middleware); also `oracle manipulation` via flash loans etc...   

`ownable` - an [owner](https://docs.openzeppelin.com/contracts/4.x/api/access#Ownable) who has special privileges   

`PeerDAS (Peer Data Availability Sampling)` - introduced in Fusaka (EIP-7594), allows nodes to verify blob data availability by sampling rather than downloading entire blobs. Major scaling improvement for rollups; reduces bandwidth/storage requirements while maintaining security. Enables higher blob throughput without proportionally increasing node burden.

`permission vs permissionless` - permissioned blockchains sacrifice decentralization/anonymity for business needs, speed, and efficiency. Permissionless (like Ethereum mainnet) allow anyone to participate.   

`permit (ERC-2612)` - an ERC-20 extension that allows token approvals via off-chain signatures instead of on-chain transactions. Users sign a permit message (containing spender, amount, deadline, nonce) with their private key; the signature can then be submitted by anyone to execute the approval. Enables gasless approvals and improves UX by combining approve + transferFrom into a single transaction. Widely used in DeFi protocols. Security note: verify deadline and nonce parameters to prevent replay attacks.

`perpetual futures (perp)` - a leveraged derivative with no expiry. Traders post margin and take long/short exposure; periodic funding payments between longs and shorts keep the mark price near an external index price (oracle). Positions are liquidated when margin cannot cover losses.

`PII` - personal Identifying information.   

`proof of concept` - piece of code that demonstrates the vulnerability is exploitable; 100Proof's [sample](https://github.com/one-hundred-proof/notional-flash-attack)  

`private functions` - it's convention to start private function names with an underscore (_): function `_functionname()` private {}    

`private relayers` - "flashbots protect; no one sees transaction and can't front run it" per 32:50 of [Dan Robinson AMA](https://www.youtube.com/watch?v=Lz7g0ny99jk) (e.g., Flashbots, Bloxroute, Ethermine, Eden)    

`Proxies` - [abstract contract](https://docs.openzeppelin.com/contracts/4.x/api/proxy) implementing the core delegation functionality (upgrading a smart contract with a new one via delegatecall) dangers include: storage clashes and function selector clashes; Patrick Collins sample [1:05:16:02](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=105362); [shorter video](https://youtu.be/NK9Dp54YEWU?t=255)   
   - implementation contract
   - proxy contract --> points to correct implementation
   - the user makes calls to proxy
   - the admin decides which contract to upgrade etc
   - small proxies, usually referred to as `clones` can be used to deploy code only once and re-use it over and over again.

`pull based patterns` - refer to design approaches where actions, funds, or data are retrieved on-demand ("pulled") by users or external actors rather than being automatically "pushed" by the contract. Instead of automatically sending funds, the contract credits a user’s balance and lets them withdraw funds via a dedicated function.
  - **Reentrancy Mitigation:** Isolates external calls from critical state updates.
  - **Gas Efficiency:** Avoids running into gas limit issues during automatic transfers.
  - **Fault Tolerance:** Prevents failed transfers from affecting overall contract operation.
- **Example:** OpenZeppelin’s `PullPayment` contract.

Data/Action Pattern    
- **Definition:** Instead of pushing state updates or data, the contract stores the necessary information for external actors to query (or "pull") on demand.
- **Benefits:**
  - **Efficiency:** Heavy computations or data retrieval occurs only when needed.
  - **Security:** Reduces the attack surface by decoupling state changes from external calls.
  - **Modularity:** Enhances maintainability and clarity by separating state updates from data retrieval.

These pull-based patterns are widely adopted in decentralized finance (DeFi) protocols to enhance security, efficiency, and robustness.   

`pure` - static, does not effect or modify state, more computational [free function]   

`Quality Assurance` (QA) - ensure the functionality, security, and efficiency of the smart contract code.  

[relayer](https://docs.openzeppelin.com/learn/sending-gasless-transactions) - `meta-transactions`, a third-party (called a relayer) can send another user’s transactions and pay themselves for the gas cost. In this scheme, users sign messages (not transactions) containing information about a transaction they would like to execute. Relayers are then responsible for signing valid Ethereum transactions with this information and sending them to the network, paying for the gas cost. A base contract preserves the identity of the user that originally requested the transaction. In this way, users can interact directly with smart contracts without needing to have a wallet or own Ether.   

`revert` - gives back gas but loses some in process; 1. [revert reason strings](https://docs.goquorum.consensys.net/configure-and-manage/manage/revert-reason)   

`remote procedure call` or [RPC](https://en.wikipedia.org/wiki/Remote_procedure_call) - when a computer program causes a procedure (subroutine) to execute in a different address space (commonly on another computer on a shared network), which is written as if it were a normal (local) procedure call, without the programmer explicitly writing the details for the remote interaction   

`RFQ (Request For Quote)` - instead of resting a limit order on-chain, an app/aggregator requests firm quotes off-chain from market makers, selects the best signed quote, and settles on-chain. Provides price certainty and low slippage for specified sizes.

[ring signature](https://www.youtube.com/watch?v=zHN_B_H_fCs) -  type of digital signature that can be performed by any member of a set of users that each have keys. Therefore, a message signed with a ring signature is endorsed by someone in a particular set of people   

`RLP Encoding` - Recursive Length Prefix (RLP) is Ethereum’s core binary serialization format; lets Ethereum pack complex, nested data structures into a compact, predictable byte stream

`safeMath` - before 0.8.0. there were overflow and underflow issues; prior to that version, solidity's "+" operator wouldn't check for overflows, leading to type(uint256).max + 1 = 0, and the safeMath library would avoid it. Now, type(uint256).max + 1 reverts with Panic(0x11), and safeMath isnt needed.   

`selfdestruct` - **Deprecated as of Dencun (March 2024)**. Previously allowed contracts to destroy themselves and send remaining ETH to a designated address. Now only transfers ETH without destroying code/storage (unless created in same transaction). Contracts using legacy `selfdestruct` behavior may break. Auditors should flag any reliance on code deletion.  

[sequencer](https://blog.bingx.com/blockchain-en/what-are-sequencers-in-ethereum-network#:~:text=A%20sequencer%20refers%20to%20a,and%20integrity%20of%20the%20blockchain) - responsible for sorting transactions and it records the (batch) transactions on its local blockchain platform; Layer 2: Arbitrum, Optimism
	 - `Schnorr` - introduces a commitment scheme for transaction ordering that enables transaction-level commitments instead of batching transactions together. 
	 - `Espresso Sequencer` - a decentralized sequencing network for rollups. Its primary objective is to deliver secure, high throughput, and low latency transaction ordering and availability. 
 	-  Auditors should look out for missing L2 sequencer activity checks when they see price code callinglatestRoundData() in projects that are to be deployed on L2s.  

`Sink` - a place where data flow ends in a sensitive effect: money moves or state mutates. Used in taint/flow analysis and DeFi to label state-write and value-movement sites as sensitive sinks.
   - State sinks: setting `fee_vault`, writing a proof PDA, updating thresholds
   - Origin: graph theory/flow networks “sink” (terminal node with incoming edges, no outgoing); adopted by AppSec and DeFi

[slippage](https://www.youtube.com/watch?v=BgR75biSjzU) - the difference between the value of an asset at order placement and the value at order fulfilment. It can be found when buying or selling assets, and can result in either a loss or a gain (higher invariants lead to less slippage; Uniswap)      

`Slots and epochs (Ethereum PoS)` - time is split into 12s slots and 32-slot epochs (~6.4 min). Each validator submits one attestation per epoch, voting on:
   - the last justified checkpoint (source),
   - the current epoch’s checkpoint (target), and
   - the chain head (head, per LMD-GHOST fork choice).
Aggregators BLS-aggregate attestations into blocks; timely, correct attestations comprise most validator rewards.

`smart contract` - programs stored on a blockchain that run when predetermined conditions are met; a transaction protocol intended to automatically execute, control or document events and actions according to the terms of a contract or an agreement; Ethereum contracts are essentially single threaded machine       
- `hybrid smart contracts` - combine code running on the blockchain (on-chain) with data and computation from outside the blockchain (off-chain) provided by decentralized oracle networks. [chainlink](https://chain.link/education-hub/hybrid-smart-contracts)   

`Solc` - the solidity compiler to byte code   

`source lines of code (SLOC)` - software metric used to measure the size of a computer program by counting the number of lines  

`staking` - the act of [depositing](https://ethereum.org/en/staking/) a minimum of 32 ETH to activate validator software. As a validator you'll be responsible for storing data, processing transactions, and adding new blocks to the blockchain. **Post-Pectra (EIP-7251, May 2025)**: validators can now hold up to 2048 ETH (previously capped at 32 ETH effective balance), enabling compounding rewards and consolidation without requiring multiple validator instances.   

`state variables` - variables stored permanently on the blockchain 

`stateless fuzzing` - where the state of the previous run is discarded for every new run   
`stateful fuzzing` - fuzzing where final state of previous run is the starting state of the next run   

`storageroot` - a hash of the root node of a Merkle Patricia tree which encodes the hash of the storage contents of this account, and is empty by default   

`struct` - useful for grouping related data, can be declared outside of a contract and imported in another contract  

`sybil attack` a [type of attack](https://en.wikipedia.org/wiki/Sybil_attack) on a computer network service in which an attacker subverts the service's reputation system by creating a large number of pseudonymous identities and uses them to gain a disproportionately large influence. It is named after the subject of the book Sybil, a case study of a woman diagnosed with dissociative identity disorder; also [sybil resistance](https://www.finder.com.au/blockchain-sybil-resistance-searching-for-the-perfect-waste-of-resources)   

`timelock` - locks functionality on an application until a certain amount of time has passed; [video](https://www.youtube.com/watch?v=P1f2a5Ckjpg)    

`topics` - indexed parameters for ‘logged’ events allow you to search for these events using the indexed parameters as filters; at most 3 parameters can receive the property indexed   


`transient storage` - introduced in Dencun (EIP-1153, March 2024). Uses `TSTORE` and `TLOAD` opcodes for storage that persists only within a transaction (cleared after tx ends). Much cheaper than regular storage (~100 gas vs 20,000). Ideal for reentrancy locks, callback data, and intra-transaction state. Auditors: check for assumptions about persistence.
`TPS` - transactions per second [chart](https://coincodex.com/article/14198/layer-1-performance-comparing-6-leading-blockchains/)     

`transfer vs. transferFrom (aka delegatedTransfer)` - `transfer` - simply transfer the tokens from one address to another; `transferFrom` -you give permission for someone else to transfer from your account; someone else can be either an externally-owned account or a smart-contract account   
 	- transferFrom vs. safeTransferFrom in ERC721:
* transferFrom: Transfers ownership of a token.   
* safeTransferFrom: Same as transferFrom but checks if the receiver is a smart contract and if so, checks to ensure it can handle ERC721 tokens.   

`tumbler` - a service that mixes potentially identifiable or "tainted" cryptocurrency funds with others, so as to obscure the trail back to the fund's original source: Tornado cash; Zcash and Zk-SNARK's?   

`TVL` - total value locked: includes all coins deposited in all functions that protocol offers: Staking, Lending, Liquidity pools   

`TWAPs or time-weighted average prices` - often used by traders to execute larger orders without causing a significant impact on the market price

`tx` -  "transaction": tx.origin, txn.gasprice; don't use [tx.origin](https://www.youtube.com/watch?v=n9PAya8GhgE)   

`unchecked` - instead of `SafeMath` can be more `gas efficient` if you know your math won’t reach top or bottom limits   

`Uniswap` - decentralized cryptocurrency [exchange](https://en.wikipedia.org/wiki/Uniswap) that uses a set of smart contracts (liquidity pools) to execute trades on its exchange; [whitepaper](https://uniswap.org/whitepaper-v3.pdf) and [billion dollar algorithm](https://www.paradigm.xyz/2021/05/liquidity-mining-on-uniswap-v3) `ticklower` and `tickupper` via [Tick Uniswap](https://docs.uniswap.org/contracts/v3/reference/core/libraries/Tick)    

`UTXO` -  an unspent transaction output (UTXO) represents some amount of digital currency which has been authorized by one account to be spent by another. UTXOs use public key cryptography to identify and transfer ownership between holders of public/private key pairs  
    
[URI](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier) - unique sequence of characters that identifies a logical or physical resource used by web technologies.   
   - https://ethereum.stackexchange.com/questions/147899/why-is-it-called-tokenuri-instead-of-tokenurl

`UUPS (Universal Upgradeable Proxy Standard)` - an upgradeable contract design pattern that separates a contract's logic from its data storage, allowing the logic to be replaced without affecting the stored data, thereby facilitating efficient and flexible smart contract upgrades; is more gas-efficient and flexible than the Transparent Upgradeable Proxy, but requires more care to ensure safety.   

`verbatim` - introduced in Solidity 0.8.4, it allows injecting precompiled bytecode into the contract, useful for specific cryptographic operations.   

`whitelisting` - allows only pre-approved entities to interact with a particular service, contract, or system within the blockchain environment; only authorized participants can access specific functionalities    

`witness` - [cryptography](https://crypto.stackexchange.com/questions/43462/what-is-a-witness-in-zero-knowledge-proof) solution to puzzle; unspent transaction output, any solution to unlock UTXO; see also [Segregated Witness](https://www.investopedia.com/terms/s/segwit-segregated-witness.asp)   

[Yul](https://docs.soliditylang.org/en/latest/yul.html) - an intermediate language between Solidity and EVM bytecode.   

`Zcash` - cryptocurrency using zk-SNARKs to provide enhanced privacy; either in a transparent pool or a shielded pool       

`zero address` - contract creation; sometimes sent in an intentional ether burn

`zero padding` — (big-endian) for taking up entire memory; if your data type is uint8 or uint32 it is still managed as uint256 values (occupies 32bytes)   

[zkproof](https://www.youtube.com/watch?v=e_Im2g2xsAg&t=81s) - method by which one party (the prover) can prove to another party (the verifier) that a given statement is true, while avoiding conveying to the verifier any information beyond the mere fact of the statement's truth [ethereum Zk docs](https://ethereum.org/en/zero-knowledge-proofs/)
   - [zkRollup](https://ethereum.org/en/developers/docs/scaling/zk-rollups/) - bundling transactions off chain and submitting a single transaction onchain 
   - `zkSNARK` - succinct non interactive argument of knowledge
   - `optimistic rollup` - assumes transactions are valid by default until proven otherwise. Incorrect transactions are challenged and rolled back.
   - zk-friendly vs. non-zk-friendly hash Functions: zk-friendly hash functions can be efficiently computed inside a zk-SNARK circuit, whereas non-zk-friendly ones can't.
   - Nullifier in Zero Knowledge: It's a unique value associated with a secret, used in zk-SNARKs protocols (like Zcash) to prevent double-spending without revealing the secret itself.



## Solidity Contract Layout

```
// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions
```

