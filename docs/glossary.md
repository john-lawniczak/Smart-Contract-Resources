# Dictionary of Key Terms (Solidity)

**Last verified: 2026-01**

For broader crypto dictionaries, see: [CoinMarketCap Glossary](https://coinmarketcap.com/alexandria/glossary) or [General Crypto Vocabulary](https://medium.datadriveninvestor.com/crypto-vocabulary-expanded-76131d26537b)

---

## Glossary

### 6

**`63/64 rule of EIP-150`** - to prevent denial-of-service attacks involving deep call stacks in Ethereum:
- Ensures when calling another contract using CALL, DELEGATECALL, or similar opcodes, the calling contract can only pass at most 63/64ths (about 98.4%) of its remaining gas to the called contract
- This guarantees the calling contract always retains a small portion (at least 1/64th) of its gas, allowing for safe termination and error handling, mitigating out-of-gas attacks

---

### A

**`Aave`** - decentralised non-custodial liquidity market protocol where users can participate as suppliers or borrowers. Suppliers provide liquidity to the market to earn a passive income, while borrowers are able to borrow in an overcollateralised (perpetually) or undercollateralised (one-block liquidity) fashion; Stani Kulechov [interview](https://www.youtube.com/watch?v=PA9QrrH-ze0) by Haseeb Qureshi -- [Aave website](https://app.aave.com/)

**`ABI`** - application binary interface specifies set of functions that can be accessed outside of smart contract; similar to a JSON; Abi.encodePacked - breaks down, via [cheatsheet](https://docs.soliditylang.org/en/latest/cheatsheet.html); [Abi.decode](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=81282); Great Patrick Collins section [22:16:31](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=80191) and [ABI encoding](https://youtu.be/sas02qSFZ74?list=PL4Rj_WH6yLgWe7TxankiqkrkVKXIwOP42&t=30003) and [difference between encoding](https://forum.openzeppelin.com/t/difference-between-abi-encodepacked-string-and-bytes-string/11837)
- [Xdeadbeefx blog: The Double-Edged Sword of abi.decode](https://medium.com/@0xdeadbeef0x/the-double-edged-sword-of-abi-decode-f81529e62bcc)

**`address`** - (Ethereum; other blockchains will be different) 42-character hexadecimal address derived from the last 20 bytes of the public key controlling the account with 0x appended in front `0x0cE446255506E92DF41614C46F1d6df9Cc969183`

**`Air state`** - algebraic intermediate representation: In zero-knowledge proofs (ZKPs), particularly in STARKs (Scalable Transparent Argument of Knowledge), AIR is a mathematical framework used to describe computations in a way that can be efficiently verified; It defines a set of constraints that an execution trace must satisfy

**[airdrop](https://www.coindesk.com/learn/what-is-a-crypto-airdrop/)** - involve blockchain-based projects and developers sending out free tokens to members of their communities as part of a broader marketing initiative

**`Alpha`** - in finance it refers to excess return of an investment relative to the return of a benchmark index

**[AMM](https://www.youtube.com/watch?v=1PbZMudPP5E)** - Automated Market Maker; underlying protocol that powers all decentralized exchanges (DEXs), DEXs help users exchange cryptocurrencies by connecting users directly, without an intermediary; autonomous trading mechanisms that eliminate the need for centralized exchanges; drawback: susceptible to front running because of publicity in mempool

**`Anti-Patterns`** - common coding practices or design patterns in smart contract development that lead to insecure, inefficient, or unmaintainable code.
**Common Examples:**
- **Reentrancy Vulnerability:** Failing to follow the Checks-Effects-Interactions pattern, enabling malicious reentrant calls
- **Using `tx.origin` for Authentication:** Relying on `tx.origin` instead of `msg.sender` to validate callers, which can be exploited by phishing attacks
- **Unbounded Loops:** Implementing loops without proper limits, risking excessive gas consumption and transaction failure
- **Direct Ether Transfers Without Checks:** Using methods like `transfer` or `call` without proper error handling, which may lead to lost funds
- **Lack of Input Validation:** Not validating inputs or state, leading to unexpected behavior or vulnerabilities
- **Hardcoding Critical Values:** Embedding constants in code that should be configurable, reducing flexibility and increasing risk
- **Overly Complex Inheritance:** Using deep or circular inheritance structures that complicate auditing and increase error risk
- **Improper Use of Libraries:** Not leveraging safe math libraries (or relying on outdated versions), leading to potential overflows/underflows

**`Application-specific integrated circuit (ASIC)`** - specialized hardware designed for a specific task. In crypto, ASICs were used for PoW mining (Bitcoin still uses them). **Note:** Ethereum transitioned to Proof-of-Stake in September 2022 (The Merge), so ASIC/GPU mining no longer applies to Ethereum

**`arrays`** - fixed [2] length of 2 elements and dynamic [] arrays with no fixed size; can also create an array of structs or 2D array

**`assertEQ`** - Assert a is [equal](https://book.getfoundry.sh/reference/forge-std/assertEq) to b

**[atomic swap](https://www.investopedia.com/terms/a/atomic-swaps.asp)** - an exchange of cryptocurrencies from separate blockchains; the term "atomic state" in which a state has no substates; it either happens or it doesn't—there is no other alternative

**`attestations (Ethereum PoS)`** - votes cast by validators in each epoch to confirm:
- **Source checkpoint**: The last justified checkpoint (from previous epoch)
- **Target checkpoint**: The current epoch's checkpoint being voted on
- **Head block**: The validator's view of the current chain head
- Validators earn most rewards through timely, correct attestations
- Attestations are aggregated using BLS signature aggregation for efficiency
- Each validator attests once per epoch (~6.4 minutes)
- Required for block finalization via Casper FFG consensus

---

### B

**[Beacon Chain](https://ethereum.org/en/roadmap/beacon-chain/)** - introduced proof-of-stake to the Ethereum ecosystem; was a [separate chain](https://www.alchemy.com/overviews/what-is-the-ethereum-beacon-chain) from the original Ethereum Mainnet, running side-by-side that merged with the original Ethereum proof-of-work chain in September 2022; [withdrawals](https://ethereum.org/en/staking/withdrawals/)

**`Beacon in Proxies`** - a beacon is a contract that provides the implementation address for proxies, allowing multiple proxies to upgrade their logic by just updating the beacon

**`Black Thursday`** [article](https://decrypt.co/61200/bitcoin-black-thursday-one-year-later) - Thursday March 12th, 2020: cryptocurrency markets suddenly collapsed (in tandem with traditional markets), with bitcoin prices getting halved in less than a day

**`blob`** - introduced in Dencun (EIP-4844, March 2024) for L2 data availability. Binary large objects (~125 KB each) attached to transactions, stored temporarily (~18 days) rather than permanently. Much cheaper than calldata for rollup data posting (~10-100x cost reduction). Uses separate fee market with `blob_base_fee` (EIP-1559 style pricing). Pectra increased blob throughput (3→6 target per block, 3→9 max); Fusaka adds PeerDAS for further scaling. Key for Ethereum's rollup-centric roadmap

**`block`** - a unit of data in a blockchain containing a collection of transactions. In Ethereum PoS:
- **Block time**: ~12 seconds (one slot)
- **Block proposer**: Validator selected to propose a block for a given slot
- **Block attestations**: Votes from validators confirming block validity
- **Finalized block**: Block that cannot be reverted (typically after 2 epochs, ~13 minutes)
- See also: slots, epochs, checkpoints, attestations

**`block.timestamp`** - convert a uint of the number of seconds in that length of time. So 1 minutes is 60, 1 hours is 3600 (60 seconds x 60 minutes), 1 days is 86400 (24 hours x 60 minutes x 60 seconds), find on [cheatsheet](https://docs.soliditylang.org/en/latest/cheatsheet.html)

**`bridges`** - a blockchain [bridge](https://blog.makerdao.com/what-are-blockchain-bridges-and-why-are-they-important-for-defi/): and [Youtube](https://www.youtube.com/watch?v=xS0PyYpt6bA) connects two blockchain ecosystems. Bridges facilitate communication between blockchains through the transfer of information and assets

**`bridge loan`** - short-term loan allowing users to temporarily borrow funds (often stablecoins or major crypto assets) while awaiting other liquidity sources, such as the settlement of cross-chain asset transfers, DeFi protocol withdrawals, or yield farming returns

**`Byzantine fault`** or [Byzantine generals problem](https://en.wikipedia.org/wiki/Byzantine_fault) - a condition of a computer system, particularly distributed computing systems, where components may fail and there is imperfect information on whether a component has failed; thus the reason for Proof of Work

---

### C

**`CFMM`** - Constant Function Market Makers: [article](https://medium.com/bollinger-investment-group/constant-function-market-makers-defis-zero-to-one-innovation-968f77022159)

**`checkpoints (Ethereum PoS)`** - epoch boundary blocks used in Casper FFG (Friendly Finality Gadget) consensus:
- **Epoch checkpoint**: First block of each epoch (every 32 slots)
- **Justified checkpoint**: Checkpoint that received attestations from ≥2/3 of validators
- **Finalized checkpoint**: Justified checkpoint with consecutive justified checkpoint in next epoch
- **Finalization**: Block becomes irreversible after ~2 epochs (~13 minutes)
- Checkpoints enable economic finality via slashing conditions
- See also: attestations, slots, epochs, LMD GHOST

**`clustering`** - tracing bitcoin via blockchain analysis; tracing Bitcoin user wallets by tracking wallet "change" creation; using tags; peel chains [How to Peel a Million](https://arxiv.org/pdf/2205.13882.pdf) Sarah Meiklejohn and team; also [A Fistful of Bitcoins](https://cseweb.ucsd.edu/~smeiklejohn/files/imc13.pdf)

**`codecopy`** - copying code from one place to another is handled by the `opcode` codecopy, [see article](https://medium.com/coinmonks/ethernaut-lvl-19-magicnumber-walkthrough-how-to-deploy-contracts-using-raw-assembly-opcodes-c50edb0f71a2)

**`Compound`** - a DeFi lending protocol that allows users to earn interest on their cryptocurrencies by depositing them into one of several pools

**`coinbase transaction`** - in PoW chains (e.g., Bitcoin), the first transaction in a block where miners collect the block reward and fees. **Note:** Ethereum (post-Merge, Sept 2022) uses PoS; validators receive rewards via the consensus layer. The term `block.coinbase` in Solidity now refers to the fee recipient address set by the block proposer

**`concentrated liquidity`** - liquidity placed within a chosen price range (e.g., Uniswap v3). Improves capital efficiency but introduces range selection, rebalancing, and fee-capture timing risks (see JIT liquidity)

**`commit-reveal scheme`** - two-step process where users first commit to a choice without revealing it. Later, they reveal their choice. This prevents others from seeing the original choice until the reveal stage. Used for voting, random number generation, etc.
- Rock-Paper-Scissors Game Design: Use a commit-reveal scheme. Players first commit (send hash of their choice + secret) and then reveal in the next step

**`constant`** - naming convention ALL_CAPS; more gas efficient

**`constructor`** - called once when contract is deployed
- [initialize function](https://stackoverflow.com/questions/72475214/solidity-why-use-initialize-function-instead-of-constructor): The contract's constructor is automatically called during contract deployment. But this is no longer possible when proxies are in play, as the constructor would change only the implementation contract's storage (Contract B), not the storage of the proxy contract (Contract A), which is the one that matters. Therefore, an additional step is required. We need to change the constructor in a regular function. This function is conventionally called initialize or init

**`creation code`** - only executed by the EVM once during the transaction that creates the contract. gets executed in a transaction, which returns a copy of the runtime code, which is the actual code of the contract. The contract's constructor is part of the creation code; it will not be present in the contract's code once it is deployed

**[custom errors](https://soliditylang.org/blog/2021/04/21/custom-errors/)** - declared at top, more gas efficient

---

### D

**`DAI`** - stablecoin on the Ethereum blockchain whose value is pegged to $US

**`dark forest`** - "all people with nodes on major blockchains grinding on mempool transactions" - 9:40 [Andrew Miller AMA](https://www.youtube.com/watch?v=IwRfEsX07MU) and later mentions [David Chaum](https://en.wikipedia.org/wiki/David_Chaum) Dan Robinson's [blog post](https://www.paradigm.xyz/2020/08/ethereum-is-a-dark-forest)

**`data Locations`** - Storage, Memory and Calldata
1. storage - variable is a state variable (store on blockchain)
2. memory - variable is in memory and it exists while a function is being called
3. calldata - originates as part of the transaction payload sent to the blockchain. When a transaction is broadcasted, the calldata is included in the transaction and passed to the EVM upon execution. It is stored in the RLP-encoded transaction on-chain, accessible only during execution. resides in a virtualized region of the EVM's memory that behaves similarly to other stack-based memory structures. It exists only during the execution of the transaction and is discarded immediately after the transaction ends. (Special data location that contains function arguments): [decoding calldata](https://youtu.be/sas02qSFZ74?t=38028)
   - Cost for setting a storage slot from zero to non-zero (higher gas cost)
   - Cost for modifying a storage slot that is already non-zero (medium gas cost)
   - CALLDATALOAD: Loads 32 bytes of calldata starting at a specific offset
   - CALLDATACOPY: Copies a segment of calldata to memory
   - CALLDATASIZE: Returns the total size of the calldata

**`delegatecall`** - identical to a message call apart from the fact that the code at the target address is executed in the context; a contract can dynamically load code from a different address at runtime. Storage, current address and balance still refer to the calling contract, only the code is taken from the called address. Patrick Collins explanation [1:05:07:37](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=104857); [shorter video](https://www.youtube.com/watch?v=uawCDnxFJ-0)

**`describe ()`** - function in [Jasmine](https://stackoverflow.com/questions/12209582/the-describe-keyword-in-javascript) framework used for testing

**`deterministic algorithm`** - an [algorithm](https://en.wikipedia.org/wiki/Deterministic_algorithm) that, given a particular input, will always produce the same output, with the underlying machine always passing through the same sequence of states

**`DLOB (Decentralized Limit Order Book)`** - an order book where makers post price/size quotes and takers match against them. Storage/matching can be fully on-chain or hybrid (off-chain relayers with on-chain settlement). Enables price-time priority and advanced order types; examples include Serum/OpenBook-style systems

**`Discrete Log Contracts (DLCs)`** - blockchain-based protocols used to create secure and private smart contracts that rely on real-world events or off-chain data, without needing to trust a single oracle. They were initially proposed by Thaddeus Dryja, co-author of the Lightning Network paper
- Transaction details remain private, as only contract participants and oracles know the details
- Oracles can't manipulate or even know how their data is used. Parties don't need to trust an oracle fully—just their honesty in publishing data
- DLCs scale well since most interactions occur off-chain. Blockchain is primarily used for settlement

**`dutch auction`** - a descending price auction; an auctioneer starts with a very high price, incrementally lowering the price until someone places a bid

---

### E

**`elliptic curve`** - [elliptic curve cryptography](https://medium.com/coinmonks/learn-how-to-code-elliptic-curve-cryptography-a952dfdc20ab) with fastecdsa library; also OZ's [ECDSA](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/ECDSA.sol) - Elliptic Curve Digital Signature Algorithm (ECDSA) operations used to verify a message was signed by the holder of the private keys of a given address

**`enums`** - useful to model choice and keep track of state/can be declared outside of a contract

**`ENS - Ethereum Name Service`** - distributed, open, and extensible naming system based on the Ethereum blockchain; [documents](https://docs.ens.domains/) and [video](https://www.youtube.com/watch?v=P8RlPsjGaR8)

**`EIP`** - (Ethereum Improvement Proposal) a formal proposal to alter some element of the Ethereum network

**`EIP-7702`** - introduced in the Pectra upgrade (May 2025), enables EOAs to temporarily act like smart contract accounts for specific transactions via a new type-4 transaction. Users sign an off-chain authorization specifying a delegate contract; the EOA's behavior temporarily becomes that of the delegate. Enables transaction batching, gas sponsorship, passkey authentication, and spending limits without requiring a new address
- **Security risks:** Phishing attacks where users are tricked into signing malicious delegation authorizations; replay/cross-chain risks; dependency on trusted delegate contracts
- **Best practices:** Only delegate to audited contracts; inspect nonces and chain IDs; use simulation tools; keep bulk assets in non-delegated EOAs

**`ERC-4626 (Tokenized Vault Standard)`** - standard interface for tokenized vaults. Auditing checks: preview/mint/redeem alignment, rounding direction (user-favorable), share:asset ratio monotonicity, fee accrual and share dilution correctness, totalAssets consistency, edge cases on zero/first depositor

**`EOA`** - Externally Owned Account; controlled by private keys (vs. contract accounts controlled by code). Post-Pectra (May 2025), EOAs can temporarily delegate to smart contract logic via EIP-7702, enabling features like batching, gas sponsorship, and passkeys while retaining the same address. This blurs the traditional EOA vs. contract account distinction. **Note:** EIP-4337 provides smart contract-based account abstraction (active since 2023) using UserOperation objects and paymasters; EIP-7702 enables native protocol-level EOA delegation

**`events`** - allow logging to the Ethereum blockchain; Use cases for events are: Listening for events and updating user interface; cheap form of storage
- Anonymous Solidity Event - does not store its signature in the topics list of the log. Instead, only the arguments are stored

**`EVM`** - Ethereum Virtual Machine. Ethereum is a stack-based architecture, single threaded. For comprehensive coverage, see [Ethereum Consensus & EVM Architecture](ethereum-consensus.md)

---

### F

**`factory contract`** - a smart contract that deploys and manages other contracts. It acts as a blueprint for creating multiple instances of a contract dynamically on-chain

**`fallback`** - special function executed either when a function that does not exist is called or Ether is sent directly to a contract but receive() does not exist or msg.data is not empty; fallback has a 2300 gas limit when called by transfer or send

**`flattened contract`** - taking a contract that uses import statements and merging it with all of its dependencies into a single .sol file, with no imports remaining; use the solidity-flattener or [forge-flatten](https://book.getfoundry.sh/reference/forge/forge-flatten#forge-flatten): Example: `forge flatten src/MyContract.sol --output out/Flat.sol`

**`flashbots`** - [independent project](https://ethereum.org/en/developers/docs/mev/) which extends execution clients with a service allowing searchers to submit MEV transactions to validators without revealing them to the public mempool; prevents transactions from being frontrun by generalized frontrunners; [video](https://www.youtube.com/watch?v=Zt15wrSDVxc)
- How to build [flashbots](https://www.youtube.com/watch?v=gme0uNyIIsE)

**`flash loan`** - a smart contract transaction in which a lender smart contract lends assets to a borrower smart contract with the condition that the assets are returned, plus an optional fee, before the end of the transaction. This ERC specifies interfaces for lenders to accept flash loan requests, and for borrowers to take temporary control of the transaction within the lender execution. The process for the safe execution of flash loans is also specified

**`flash-swap`** - all trades must occur during single transaction: opportunity for arbitragers

**`floating point arithmetic`** - Solidity doesn't support floating point arithmetic natively due to the deterministic nature of the Ethereum Virtual Machine (EVM). Floating point operations can lead to imprecise calculations, which are not suitable for financial operations on a blockchain where exactness is paramount. However, developers can use fixed-point arithmetic libraries to achieve decimal-like precision

**`flooding`** - [routing](https://en.wikipedia.org/wiki/Flooding_%28computer_networking%29)

**`fork`** - a radical change to a network's protocol that makes previously invalid blocks and transactions valid, or vice-versa. A hard fork requires all nodes to upgrade

**Ethereum Upgrade Timeline (recent):**
- **Pectra** (May 7, 2025): Prague + Electra. Key EIPs: EIP-7702 (EOA account abstraction), EIP-7251 (validator max balance to 2048 ETH), EIP-6110 (faster deposits), EIP-7691 (blob throughput increase 3→6 target), EIP-2537 (BLS12-381 precompile)
- **Fusaka** (Dec 3, 2025): Fulu + Osaka. Key EIPs: EIP-7594 (PeerDAS for data availability sampling), EIP-7935 (60M block gas limit), EIP-7825 (16.7M tx gas cap), EIP-7951 (secp256r1/P-256 precompile for WebAuthn), EIP-7939 (CLZ opcode). BPO forks follow for incremental blob scaling
- **Dencun** (Mar 2024): Introduced blobs (EIP-4844) for L2 data availability, `TSTORE`/`TLOAD` transient storage (EIP-1153), `MCOPY` opcode (EIP-5656), `BLOBHASH` opcode, deprecated `SELFDESTRUCT` (EIP-6780)
- **Shanghai** (Apr 2023): Enabled staking withdrawals post-Merge, added `PUSH0` opcode (EIP-3855)

**`function selector`** - first 4 bytes of the function signature: ex: 0xa9059cbb; excellent Patrick Collins section [22:46:43](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=82003); [shorter video](https://www.youtube.com/watch?v=Mn4e4w8h6n8); there can be function selector clashes

**`function signature`** - string that defines function name & parameters: ex: "transfer(address, uint256)"

**[visibility specifiers](https://docs.soliditylang.org/en/latest/cheatsheet.html#:~:text=Type%20Information.-,Function%20Visibility%20Specifiers,%EF%83%81,-open%20in%20Remix)**
- `public` makes the function callable from any contract. If no visibility is specified for a function, it defaults to public
- `external` makes the function callable only from other contracts. These functions are often used for interactions between contracts. Note that they cannot be called internally, i.e., from within the same contract
- `private` makes the function callable only from within the contract where it is defined
- `internal` makes the function callable only from within the contract where it is defined, or from contracts that derive from it (i.e., contracts that inherit from it)
- `view` used for functions that do not alter the state of the contract (i.e., they don't change any state variables)
- `pure` used for functions that not only do not alter the state of the contract, but also do not access any data in the contract. These functions solely operate on their input parameters
- `payable` allows a function to receive Ether together with a call. If a function is not marked payable, it will reject any Ether sent to it
- Public `state variables` automatically generate getter functions

**`fuzzing`** - or fuzz testing involves providing invalid, unexpected, or random data as inputs in an attempt to break/crash the system

---

### G

**`gas`** - transactions with higher gas price have higher priority to be included in a block

**`genesis block`** - the first block mined on a [blockchain](https://www.investopedia.com/terms/g/genesis-block.asp)

**[Graph, The](https://www.youtube.com/watch?v=7gC7xJ_98r8)** - Google for the blockchain; querying and indexing the blockchain

**`griefing`** - malicious/trollish behavior where an actor intentionally disrupts or harms the user experience without benefit to themselves

---

### H

**`hashcash`** - a proof-of-work system invented by Adam Back in 1997 as a way to prevent email spam [precursor to Bitcoin](https://nakamoto.com/hashcash/)

**`Hashed Timelock Contract`** or (HTLC) reduces counterparty risk by creating a time-based escrow that requires a cryptographic passphrase for unlocking via [investopedia](https://www.investopedia.com/terms/h/hashed-timelock-contract.asp)

**[heartbeat, oracle](https://docs.chain.link/data-feeds/price-feeds/addresses/?network=ethereum)** click show more details - refers to an oracle providing regular updates at fixed intervals

**`hooks (Uniswap v4)`** - callback contracts invoked before/after core pool actions (initialize, add/remove liquidity, swap, donate). Risks: reentrancy, griefing via reverts, gas bombs, and price manipulation through callbacks. Require strict ordering, access control, limits, and integration tests

**`Howey Test`** - refers to the U.S. Supreme Court [case](https://www.investopedia.com/terms/h/howey-test.asp) for determining whether a transaction qualifies as an "investment contract," and therefore would be considered a security; (per Infinite Machine Chp. White-Shoe Lawyers) Ether presale was classified as a utility, a function of ethereum and therefore not a security; manner distribution of a product and not as a speculative investment; essentially a utility token

---

### I

**`immutable`** - can be set inside the constructor but cannot be modified afterwards, more gas efficient: `i_owner` - i meaning immutable

**`impermanent loss`** - a temporary loss of funds occurring when providing liquidity; occurs when the mathematical formula adjusts the asset ratio in a pool to ensure they remain at 50:50 in terms of value and the liquidity provider loses out on gains from a deposited asset that outperforms; [whiteboard crypto video](https://www.youtube.com/watch?v=_m6Mowq3Ptk)

**`interface`** - a list of function definitions without implementation. In other words, an interface is a description of all functions that an object must have for it to operate; convention preface `I` as in IERC721; [video](https://www.youtube.com/watch?v=tbjyc-VQaQo)

**`internal`** - can't be called directly from outside the contract; same as private, except it's accessible to contracts that inherit

**`intents`** - users express desired outcomes (e.g., "swap X for Y at best price") rather than specific transactions. Solvers/routers fulfill intents via auctions or matching (e.g., CoW Protocol). Security/MEV implications: solver incentives, fair routing, and replay/manipulation resistance of signed intents

**`interoperability`** - the ability of independent distributed ledger networks to communicate with each other, exchange and make use of data; ability to move a digital asset between two or more blockchains while maintaining the state and uniqueness of the asset consistent throughout the process

**`invariant`** - [invariant](https://en.wikipedia.org/wiki/Class_invariant) a computer programming construct consisting of a set of invariant properties that remain uncompromised regardless of the state of the object; a property of a system that should always hold
- Stateless fuzzing: where the state of the previous run is discarded for every new run
- Stateful fuzzing: fuzzing where final state of previous run is the starting state of the next run

**`IPFS`** - InterPlanetary File System [(IPFS)](https://docs.ipfs.tech/) a set of composable, peer-to-peer protocols for addressing, routing, and transferring content-addressed data in a decentralized file system; see also [Swarm](https://www.ethswarm.org/)

**`it()`** - defined by the jasmine [testing framework](https://stackoverflow.com/questions/28353232/what-is-the-it-function-here-doing), to declare the expected output and have a fair check if it matches the coded conditions

**`import path resolution`** - name [import](https://docs.soliditylang.org/en/latest/path-resolution.html)

---

### J

**`JIT (Just-In-Time liquidity)`** - in concentrated-liquidity AMMs (e.g., Uniswap v3/v4), LPs add liquidity only for the block/ticks of a large swap to capture fees, then remove it immediately. A timing/game-theory tactic; Uniswap v4 hooks can penalize/reshape this behavior

---

### K

**`Keccak256`** - [SHA-3](https://en.wikipedia.org/wiki/SHA-3)/Secure Hash Algorithm; using it in a [contract](https://www.youtube.com/watch?v=wCD3fOlsGc4)

**`Know Your Customer`** or KYC - guidelines and regulations in financial services that require professionals to verify the identity, suitability, and risks involved with maintaining a business relationship with a customer; providing documents AML (anti money laundering)

---

### L

**`layer 0`** - the underlying infrastructure upon which multiple Layer 1 blockchains can be built; a network framework running beneath the blockchain. It is made up of protocols, connections, hardware, validators/nodes, and more that forms the foundation of the blockchain ecosystem. Layer: 0, 1, 2, 3 etc.

**`linting`** - the process of running a program that will analyze code for potential errors (verifying code quality) [eslint](https://eslint.org/)

**[liquidity pool](https://www.youtube.com/watch?v=dVJzcFDo498)** - a smart contract containing large portions of cryptocurrency, digital assets, tokens, or virtual coins locked up and ready to provide essential liquidity for networks that facilitate decentralized trading

**`LVR (Loss Versus Rebalancing)`** - measure of LP underperformance vs a continuously rebalanced reference portfolio due to adverse selection and backrunning. Used to evaluate AMM design and fee tiers; impacted by oracle quality, latency, and liquidity-timing strategies like JIT

**`LMD GHOST (Latest Message Driven Greediest Heaviest Observed SubTree)`** - Ethereum's fork choice rule that determines the canonical chain:
- **Latest Message Driven**: Uses validators' most recent attestations (votes)
- **GHOST**: Greedy Heaviest Observed SubTree algorithm
- **Function**: When multiple competing chains exist, choose the fork with the most validator attestations (highest "weight")
- **Integration**: Works with Casper FFG for finality; GHOST handles short-term fork choice, Casper FFG provides long-term finality
- **Security**: Protects against chain reorganizations by following the chain with most validator support
- Replaced the previous longest-chain rule (from PoW) with a vote-weighted approach
- See also: attestations, checkpoints, slots, epochs

---

### M

**`magic number`** [wiki](https://en.wikipedia.org/wiki/Magic_number_(programming)) unique value with unexplained meaning or multiple occurrences which could (preferably) be replaced with a named constant

**`mempool`** - or [memory pool](https://www.alchemy.com/overviews/what-is-a-mempool) is a dynamic staging area in front of the blockchain that enables transaction ordering, fee prioritization, and general block construction; a list of pending transactions waiting for validation from a node before it is committed to a block on the blockchain

**`meta-transactions`** - a transaction without the end-user directly paying for gas: users sign transactions off-chain, and a third-party service called a relayer submits the transaction to the blockchain, paying gas on the user's behalf

**`MEV`** - maximal (formerly miner) extractable value; referred to as an "invisible tax" that can be extracted from block production. In modern Ethereum (post-Merge), MEV extraction involves **Proposer-Builder Separation**: specialized **block builders** construct optimal blocks to maximize MEV, while **validators** (proposers) select and propose the most profitable block. This separates the complex work of MEV extraction from validation duties, allowing validators to earn MEV rewards without sophisticated infrastructure. See MEV section in DeFi guide; [video](https://youtu.be/u4sV-Btg1Ag)

**`mocking`** - creating objects that simulate the behaviour of real objects; primarily used in unit testing; [Patrick Collins mocks](https://youtu.be/sas02qSFZ74?t=2553)

**`modifier`** - `_;` check requirements prior to execution code that can be run before and/or after a function call
1. Restrict access
2. Validate inputs
3. Guard against reentrancy hack

**`msg.sender`** - there will always be a msg.sender; one who call contract

**`musked`** - refers to the transaction payload being obfuscated or spoofed (always verify transactions at the smart contract data level, not just UI)

---

### N

**[Named imports](https://youtu.be/umepbfKp5rI?t=13460)**

**`NatSpec`** - Ethereum Natural Language Specification [Format](https://docs.soliditylang.org/en/v0.8.19/natspec-format.html) @title and @author are straightforward; @notice explains the contract function does; @dev is for explaining extra details to developers; @param and @return are for describing what each parameter and return value of a function are for

**`Nick Szabo`** - [Nick Szabo](https://en.wikipedia.org/wiki/Nick_Szabo) coined the phrase and concept of "smart contracts"

**`node`** - blockchains are decentralized, immutable, digital ledgers shared across a peer-to-peer network. Acting as a database, transaction data is permanently recorded, stored and encrypted onto the "blocks" that are then "chained" together. The physical, electronic devices (a computer, typically) that maintain copies of the chains webbing a network together, keeping the blockchain operational, are called [nodes](https://builtin.com/blockchain/blockchain-node)
- lightweight nodes - are downloaded wallets connected to full nodes for validating the data stored on the blockchain. Simple Payment Verification (SPV) node or lightweight node is used in day-to-day crypto operations

**`nonce`** - transaction code for this account starting with 0; makes transactions unique; important regarding concurrency; If the account is an externally owned account, this number represents the number of transactions sent from the account's address. If the account is a contract account, the nonce is the number of contracts created by the account; [short video](https://youtu.be/EOgpr73-pgc)

---

### O

**`observation cardinality`** - the capacity (number of stored samples) in an AMM pool's oracle ring buffer used for TWAPs (e.g., Uniswap). Higher cardinality ⇒ more samples/longer, smoother TWAPs with extra storage/gas; too low ⇒ easier to bias/short windows

**`Omner blocks`** - **Historical (PoW only)**: previously called Uncle blocks, it was possible for two blocks to be created simultaneously by a network. When this happened, one block would be left out. This leftover block was called an ommer block, referring to the familial relationships used to describe block positions within a blockchain. **Note:** Ethereum's Proof-of-Stake consensus (post-Merge, Sept 2022) eliminated uncle/ommer blocks; PoS uses a slot-based system where only one proposer per slot can create a block

**`Opcode`** - operation code; the portion of a machine language instruction that specifies the operation to be performed; see gas [Opcode](https://github.com/crytic/evm-opcodes)

**`oracle`** - entities that connect blockchains to external systems, thereby enabling smart contracts to execute based upon inputs and outputs from the real world; a way for the decentralized ecosystem to access existing data sources, legacy systems, and advanced computations (blockchain middleware); also `oracle manipulation` via flash loans etc...

**`ownable`** - an [owner](https://docs.openzeppelin.com/contracts/4.x/api/access#Ownable) who has special privileges

---

### P

**`PeerDAS (Peer Data Availability Sampling)`** - introduced in Fusaka (EIP-7594), allows nodes to verify blob data availability by sampling rather than downloading entire blobs. Major scaling improvement for rollups; reduces bandwidth/storage requirements while maintaining security. Enables higher blob throughput without proportionally increasing node burden

**`permission vs permissionless`** - permissioned blockchains sacrifice decentralization/anonymity for business needs, speed, and efficiency. Permissionless (like Ethereum mainnet) allow anyone to participate

**`permit (ERC-2612)`** - an ERC-20 extension that allows token approvals via off-chain signatures instead of on-chain transactions. Users sign a permit message (containing spender, amount, deadline, nonce) with their private key; the signature can then be submitted by anyone to execute the approval. Enables gasless approvals and improves UX by combining approve + transferFrom into a single transaction. Widely used in DeFi protocols. Security note: verify deadline and nonce parameters to prevent replay attacks

**`perpetual futures (perp)`** - a leveraged derivative with no expiry. Traders post margin and take long/short exposure; periodic funding payments between longs and shorts keep the mark price near an external index price (oracle). Positions are liquidated when margin cannot cover losses

**`PII`** - personal Identifying information

**`proof of concept`** - piece of code that demonstrates the vulnerability is exploitable; 100Proof's [sample](https://github.com/one-hundred-proof/notional-flash-attack)

**`private functions`** - it's convention to start private function names with an underscore (_): function `_functionname()` private {}

**`private relayers`** - "flashbots protect; no one sees transaction and can't front run it" per 32:50 of [Dan Robinson AMA](https://www.youtube.com/watch?v=Lz7g0ny99jk) (e.g., Flashbots, Bloxroute, Ethermine, Eden)

**`Proxies`** - [abstract contract](https://docs.openzeppelin.com/contracts/4.x/api/proxy) implementing the core delegation functionality (upgrading a smart contract with a new one via delegatecall) dangers include: storage clashes and function selector clashes; Patrick Collins sample [1:05:16:02](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=105362); [shorter video](https://youtu.be/NK9Dp54YEWU?t=255)
- implementation contract
- proxy contract --> points to correct implementation
- the user makes calls to proxy
- the admin decides which contract to upgrade etc
- small proxies, usually referred to as `clones` can be used to deploy code only once and re-use it over and over again

**`pull based patterns`** - refer to design approaches where actions, funds, or data are retrieved on-demand ("pulled") by users or external actors rather than being automatically "pushed" by the contract. Instead of automatically sending funds, the contract credits a user's balance and lets them withdraw funds via a dedicated function
- **Reentrancy Mitigation:** Isolates external calls from critical state updates
- **Gas Efficiency:** Avoids running into gas limit issues during automatic transfers
- **Fault Tolerance:** Prevents failed transfers from affecting overall contract operation
- **Example:** OpenZeppelin's `PullPayment` contract

**Data/Action Pattern:**
- **Definition:** Instead of pushing state updates or data, the contract stores the necessary information for external actors to query (or "pull") on demand
- **Benefits:**
  - **Efficiency:** Heavy computations or data retrieval occurs only when needed
  - **Security:** Reduces the attack surface by decoupling state changes from external calls
  - **Modularity:** Enhances maintainability and clarity by separating state updates from data retrieval

These pull-based patterns are widely adopted in decentralized finance (DeFi) protocols to enhance security, efficiency, and robustness

**`pure`** - static, does not effect or modify state, more computational [free function]

---

### Q

**`Quality Assurance`** (QA) - ensure the functionality, security, and efficiency of the smart contract code

---

### R

**[relayer](https://docs.openzeppelin.com/learn/sending-gasless-transactions)** - `meta-transactions`, a third-party (called a relayer) can send another user's transactions and pay themselves for the gas cost. In this scheme, users sign messages (not transactions) containing information about a transaction they would like to execute. Relayers are then responsible for signing valid Ethereum transactions with this information and sending them to the network, paying for the gas cost. A base contract preserves the identity of the user that originally requested the transaction. In this way, users can interact directly with smart contracts without needing to have a wallet or own Ether

**`revert`** - gives back gas but loses some in process; 1. [revert reason strings](https://docs.goquorum.consensys.net/configure-and-manage/manage/revert-reason)

**`remote procedure call`** or [RPC](https://en.wikipedia.org/wiki/Remote_procedure_call) - when a computer program causes a procedure (subroutine) to execute in a different address space (commonly on another computer on a shared network), which is written as if it were a normal (local) procedure call, without the programmer explicitly writing the details for the remote interaction

**`RFQ (Request For Quote)`** - instead of resting a limit order on-chain, an app/aggregator requests firm quotes off-chain from market makers, selects the best signed quote, and settles on-chain. Provides price certainty and low slippage for specified sizes

**[ring signature](https://www.youtube.com/watch?v=zHN_B_H_fCs)** - type of digital signature that can be performed by any member of a set of users that each have keys. Therefore, a message signed with a ring signature is endorsed by someone in a particular set of people

**`RLP Encoding`** - Recursive Length Prefix (RLP) is Ethereum's core binary serialization format; lets Ethereum pack complex, nested data structures into a compact, predictable byte stream

**`ray`** - fixed-point decimal representation with 27 decimal places (10^27) used in DeFi protocols for high-precision calculations:
- **Value**: 1 ray = 1e27 = 1,000,000,000,000,000,000,000,000,000
- **Usage**: Interest rates, rate accumulators, multiplication factors
- **Example**: Interest rate of 5% APY represented as 1.05e27 ray
- **Common in**: MakerDAO, Aave, Compound (rate calculations)
- **Precision**: Avoids rounding errors in compound interest calculations
- **Operations**: rayMul (multiply), rayDiv (divide), rayPow (exponentiation)
- See also: wad (18 decimals)

---

### S

**`safeMath`** - before 0.8.0. there were overflow and underflow issues; prior to that version, solidity's "+" operator wouldn't check for overflows, leading to type(uint256).max + 1 = 0, and the safeMath library would avoid it. Now, type(uint256).max + 1 reverts with Panic(0x11), and safeMath isnt needed

**`selfdestruct`** - **Deprecated as of Dencun (March 2024)**. Previously allowed contracts to destroy themselves and send remaining ETH to a designated address. Now only transfers ETH without destroying code/storage (unless created in same transaction). Contracts using legacy `selfdestruct` behavior may break. Auditors should flag any reliance on code deletion

**[sequencer](https://blog.bingx.com/blockchain-en/what-are-sequencers-in-ethereum-network#:~:text=A%20sequencer%20refers%20to%20a,and%20integrity%20of%20the%20blockchain)** - responsible for sorting transactions and it records the (batch) transactions on its local blockchain platform; Layer 2: Arbitrum, Optimism
- `Schnorr` - introduces a commitment scheme for transaction ordering that enables transaction-level commitments instead of batching transactions together
- `Espresso Sequencer` - a decentralized sequencing network for rollups. Its primary objective is to deliver secure, high throughput, and low latency transaction ordering and availability
- Auditors should look out for missing L2 sequencer activity checks when they see price code calling latestRoundData() in projects that are to be deployed on L2s

**`Sink`** - a place where data flow ends in a sensitive effect: money moves or state mutates. Used in taint/flow analysis and DeFi to label state-write and value-movement sites as sensitive sinks
- State sinks: setting `fee_vault`, writing a proof PDA, updating thresholds
- Origin: graph theory/flow networks "sink" (terminal node with incoming edges, no outgoing); adopted by AppSec and DeFi

**[slippage](https://www.youtube.com/watch?v=BgR75biSjzU)** - the difference between the value of an asset at order placement and the value at order fulfilment. It can be found when buying or selling assets, and can result in either a loss or a gain (higher invariants lead to less slippage; Uniswap)

**`Slots and epochs (Ethereum PoS)`** - fundamental time units in Ethereum's Proof-of-Stake consensus (see [Ethereum Consensus Guide](ethereum-consensus.md) for full details):

**Slots:**
- **Duration**: 12 seconds
- **Function**: Opportunity for a validator to propose a block
- **Selection**: One validator randomly selected per slot to be block proposer
- **Attestations**: All active validators attest to their view of the chain each slot
- **Empty slots**: Possible if selected proposer is offline

**Epochs:**
- **Duration**: 32 slots = ~6.4 minutes
- **Function**: Checkpoint boundary for finality via Casper FFG
- **Validator duties**: Each validator attests exactly once per epoch
- **Committee rotation**: Validators assigned to different slots each epoch
- **Finalization**: Blocks finalize after 2 consecutive justified epochs

**Consensus Flow:**
1. **Slot N**: Proposer creates block, validators attest
2. **Attestations vote on**: 
   - Source checkpoint (last justified, previous epoch)
   - Target checkpoint (current epoch boundary)
   - Head block (chain tip, via LMD GHOST)
3. **Justification**: Checkpoint with ≥2/3 validator attestations becomes justified
4. **Finalization**: Justified checkpoint with consecutive justified checkpoint in next epoch becomes finalized

**Reward Structure:**
- Timely, correct attestations earn most validator rewards
- BLS signature aggregation combines attestations efficiently
- Penalties for late or incorrect attestations

See also: attestations, checkpoints, LMD GHOST, blocks

**`smart contract`** - programs stored on a blockchain that run when predetermined conditions are met; a transaction protocol intended to automatically execute, control or document events and actions according to the terms of a contract or an agreement; Ethereum contracts are essentially single threaded machine
- `hybrid smart contracts` - combine code running on the blockchain (on-chain) with data and computation from outside the blockchain (off-chain) provided by decentralized oracle networks. [chainlink](https://chain.link/education-hub/hybrid-smart-contracts)

**`Solc`** - the solidity compiler to byte code

**`source lines of code (SLOC)`** - software metric used to measure the size of a computer program by counting the number of lines

**`staking`** - the act of [depositing](https://ethereum.org/en/staking/) a minimum of 32 ETH to activate validator software. As a validator you'll be responsible for storing data, processing transactions, and adding new blocks to the blockchain. **Post-Pectra (EIP-7251, May 2025)**: validators can now hold up to 2048 ETH (previously capped at 32 ETH effective balance), enabling compounding rewards and consolidation without requiring multiple validator instances

**`state variables`** - variables stored permanently on the blockchain

**`stateless fuzzing`** - where the state of the previous run is discarded for every new run

**`stateful fuzzing`** - fuzzing where final state of previous run is the starting state of the next run

**`storageroot`** - a hash of the root node of a Merkle Patricia tree which encodes the hash of the storage contents of this account, and is empty by default

**`struct`** - useful for grouping related data, can be declared outside of a contract and imported in another contract

**`sybil attack`** a [type of attack](https://en.wikipedia.org/wiki/Sybil_attack) on a computer network service in which an attacker subverts the service's reputation system by creating a large number of pseudonymous identities and uses them to gain a disproportionately large influence. It is named after the subject of the book Sybil, a case study of a woman diagnosed with dissociative identity disorder; also [sybil resistance](https://www.finder.com.au/blockchain-sybil-resistance-searching-for-the-perfect-waste-of-resources)

---

### T

**`timelock`** - locks functionality on an application until a certain amount of time has passed; [video](https://www.youtube.com/watch?v=P1f2a5Ckjpg)

**`topics`** - indexed parameters for 'logged' events allow you to search for these events using the indexed parameters as filters; at most 3 parameters can receive the property indexed

**`transient storage`** - introduced in Dencun (EIP-1153, March 2024). Uses `TSTORE` and `TLOAD` opcodes for storage that persists only within a transaction (cleared after tx ends). Much cheaper than regular storage (~100 gas vs 20,000). Ideal for reentrancy locks, callback data, and intra-transaction state. Auditors: check for assumptions about persistence

**`TPS`** - transactions per second [chart](https://coincodex.com/article/14198/layer-1-performance-comparing-6-leading-blockchains/)

**`transfer vs. transferFrom (aka delegatedTransfer)`** - `transfer` - simply transfer the tokens from one address to another; `transferFrom` - you give permission for someone else to transfer from your account; someone else can be either an externally-owned account or a smart-contract account
- transferFrom vs. safeTransferFrom in ERC721:
  - transferFrom: Transfers ownership of a token
  - safeTransferFrom: Same as transferFrom but checks if the receiver is a smart contract and if so, checks to ensure it can handle ERC721 tokens

**`tumbler`** - a service that mixes potentially identifiable or "tainted" cryptocurrency funds with others, so as to obscure the trail back to the fund's original source: Tornado cash; Zcash and Zk-SNARK's?

**`TVL`** - total value locked: includes all coins deposited in all functions that protocol offers: Staking, Lending, Liquidity pools

**`TWAPs or time-weighted average prices`** - often used by traders to execute larger orders without causing a significant impact on the market price

**`tx`** - "transaction": tx.origin, txn.gasprice; don't use [tx.origin](https://www.youtube.com/watch?v=n9PAya8GhgE)

---

### U

**`unchecked`** - instead of `SafeMath` can be more gas efficient if you know your math won't reach top or bottom limits

**`Uniswap`** - decentralized cryptocurrency [exchange](https://en.wikipedia.org/wiki/Uniswap) that uses a set of smart contracts (liquidity pools) to execute trades on its exchange; [whitepaper](https://uniswap.org/whitepaper-v3.pdf) and [billion dollar algorithm](https://www.paradigm.xyz/2021/05/liquidity-mining-on-uniswap-v3) `ticklower` and `tickupper` via [Tick Uniswap](https://docs.uniswap.org/contracts/v3/reference/core/libraries/Tick)

**`UTXO`** - an unspent transaction output (UTXO) represents some amount of digital currency which has been authorized by one account to be spent by another. UTXOs use public key cryptography to identify and transfer ownership between holders of public/private key pairs

**[URI](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier)** - unique sequence of characters that identifies a logical or physical resource used by web technologies
- [Why tokenURI instead of tokenURL](https://ethereum.stackexchange.com/questions/147899/why-is-it-called-tokenuri-instead-of-tokenurl)

**`UUPS (Universal Upgradeable Proxy Standard)`** - an upgradeable contract design pattern that separates a contract's logic from its data storage, allowing the logic to be replaced without affecting the stored data, thereby facilitating efficient and flexible smart contract upgrades; is more gas-efficient and flexible than the Transparent Upgradeable Proxy, but requires more care to ensure safety

---

### V

**`verbatim`** - introduced in Solidity 0.8.4, it allows injecting precompiled bytecode into the contract, useful for specific cryptographic operations

---

### W

**`wad`** - fixed-point decimal representation with 18 decimal places (10^18) used in DeFi protocols for token amounts and prices:
- **Value**: 1 wad = 1e18 = 1,000,000,000,000,000,000
- **Usage**: Token amounts, prices, balances (matches ERC-20 standard decimals)
- **Example**: 1.5 ETH = 1.5e18 wad = 1,500,000,000,000,000,000
- **Common in**: MakerDAO (DAI calculations), most ERC-20 tokens
- **Operations**: wadMul (multiply), wadDiv (divide), wadExp (exponentiation)
- **Precision**: Standard for Ethereum token amounts, prevents fractional wei issues
- **Conversion**: 1 wad = 1e-9 ray (ray has 27 decimals, wad has 18)
- See also: ray (27 decimals for higher precision)

**`whitelisting`** - allows only pre-approved entities to interact with a particular service, contract, or system within the blockchain environment; only authorized participants can access specific functionalities

**`witness`** - [cryptography](https://crypto.stackexchange.com/questions/43462/what-is-a-witness-in-zero-knowledge-proof) solution to puzzle; unspent transaction output, any solution to unlock UTXO; see also [Segregated Witness](https://www.investopedia.com/terms/s/segwit-segregated-witness.asp)

---

### Y

**[Yul](https://docs.soliditylang.org/en/latest/yul.html)** - an intermediate language between Solidity and EVM bytecode

---

### Z

**`Zcash`** - cryptocurrency using zk-SNARKs to provide enhanced privacy; either in a transparent pool or a shielded pool

**`zero address`** - contract creation; sometimes sent in an intentional ether burn

**`zero padding`** — (big-endian) for taking up entire memory; if your data type is uint8 or uint32 it is still managed as uint256 values (occupies 32bytes)

**[zkproof](https://www.youtube.com/watch?v=e_Im2g2xsAg&t=81s)** - method by which one party (the prover) can prove to another party (the verifier) that a given statement is true, while avoiding conveying to the verifier any information beyond the mere fact of the statement's truth [ethereum Zk docs](https://ethereum.org/en/zero-knowledge-proofs/)
- [zkRollup](https://ethereum.org/en/developers/docs/scaling/zk-rollups/) - bundling transactions off chain and submitting a single transaction onchain
- `zkSNARK` - succinct non interactive argument of knowledge
- `optimistic rollup` - assumes transactions are valid by default until proven otherwise. Incorrect transactions are challenged and rolled back
- zk-friendly vs. non-zk-friendly hash Functions: zk-friendly hash functions can be efficiently computed inside a zk-SNARK circuit, whereas non-zk-friendly ones can't
- Nullifier in Zero Knowledge: It's a unique value associated with a secret, used in zk-SNARKs protocols (like Zcash) to prevent double-spending without revealing the secret itself

---

[← Back to Main](../README.md)
