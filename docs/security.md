# Security & Testing

**Last verified: 2026-01**

---

## Emergency Response

- [Seal-911](https://github.com/security-alliance/seal-911) - emergency response for hacks and exploits

---

## Common Vulnerabilities

For a comprehensive list of Web3 exploits and attack vectors, see:
- **[Web3 Exploits Reference](../src/web3-exploits.md)** - detailed categorization of precision loss, oracle manipulation, liquidation attacks, MEV, flash loans, and more

---

## Top Vulnerability Categories (Ranked by Impact)

> **Quick Reference:** This section ranks the most critical vulnerability types by historical losses and exploit frequency. Each category includes real-world examples, subcategories, and mitigation strategies.

**Ranking Summary:**
1. **Price/Oracle Manipulation** - $500M+ in losses (Mango, Inverse, Cream)
2. **Accounting/Share Inflation** - Common in vaults, total fund theft risk
3. **Reentrancy Attacks** - Still prevalent, evolving variants (read-only)
4. **Access Control Failures** - High impact in rushed deployments ($611M Poly)
5. **Account Abstraction (ERC-4337)** - Emerging attack surface
6. **L2/Rollup Security** - Critical for rollup deployments
7. **Cross-Chain Bridges** - Highest single-incident losses ($625M Ronin)

---

### 1. Price/Oracle Manipulation 

**Why #1:** Highest historical losses ($500M+ across Mango, Inverse, Cream Finance)

#### A. Flash Loan Price Manipulation
- **Single-block oracle attacks** - manipulate spot price within one transaction
- **DEX spot price manipulation** - drain protocol using flash-loan-manipulated AMM prices
- **Donation attacks on LP pools** - inflate reserves to skew price calculations
- **Example:** Mango Markets ($110M) - manipulated oracle via leveraged positions

#### B. Stale Oracle Data
- **Missing freshness checks** - accepting outdated price data
- **Chainlink sequencer downtime on L2s** - L2 sequencer offline but oracle still returns prices
- **Circuit breaker bypasses** - no emergency pause when prices deviate significantly
- **Example:** Venus Protocol exploits - stale price exploitation

#### C. Oracle Precision/Rounding
- **Decimal mismatches** - mixing 8-decimal (Chainlink) with 18-decimal (ERC20) tokens
- **Division before multiplication** - precision loss in price calculations
- **Price denominator errors** - incorrect base/quote currency assumptions
- **Example:** Multiple Compound forks - rounding vulnerabilities

#### D. Multi-Oracle Manipulation
- **Median oracle gaming** - manipulate enough oracles to shift median
- **TWAP window manipulation** - exploit short time windows or low cardinality
- **Cross-oracle arbitrage** - exploit price differences between oracle sources
- **Example:** Euler Finance edge cases

---

### 2. Accounting/Share Inflation Attacks 

**Why #2:** Common in vault protocols, can lead to total theft of user funds

#### A. First Depositor Inflation
- **Classic ERC-4626 attack** - first depositor inflates share price
- **Donation + front-run** - donate large amount, front-run victim deposit
- **Rounding to zero shares** - victim receives 0 shares due to rounding down
- **Example:** Multiple yield vaults (Silo Finance, others)

#### B. Share Dilution
- **Donate to inflate share price** - make share price extremely high
- **Victim gets 0 shares** - deposit rounds down to zero shares
- **Attacker steals via redemption** - redeem inflated shares for profit
- **Example:** Sentiment Protocol - share inflation vulnerability

#### C. Accounting Mismatch
- **Deposit uses actual shares** - records shares based on deposit
- **Withdraw uses convertToShares** - recalculates shares at withdrawal
- **Divergence causes underflow/theft** - inconsistent accounting enables theft
- **Example:** Common pattern in vault implementations

#### D. Virtual Share Bypass
- **Insufficient virtual offset** - using offset <1e6 still exploitable
- **Attack still profitable with low offset** - cost of attack < potential profit
- **Example:** Protocols using +1 or +1000 offset (insufficient)

**Mitigation:** Use virtual shares with offset ≥1e6 (1 million) or OpenZeppelin's ERC4626 implementation

---

### 3. Reentrancy (Classic & Read-Only)

**Why #3:** Still prevalent, evolving attack vectors despite awareness

#### A. Cross-Function Reentrancy
- **Reenter different function mid-execution** - exploit state between functions
- **State inconsistency exploitation** - function A updates state, reenter function B
- **Example:** Cream Finance V2 - cross-function reentrancy

#### B. Cross-Contract Reentrancy
- **Reenter through different contract** - exploit shared state across contracts
- **Shared state manipulation** - manipulate state in contract A, affect contract B
- **Example:** Grim Finance ($30M) - cross-contract reentrancy

#### C. Read-Only Reentrancy
- **View functions return stale state** - state not yet updated during callback
- **External protocols read during callback** - dependent protocols see inconsistent state
- **Price/balance inconsistency** - LP token pricing before reserves updated
- **Example:** Curve/Vyper exploit ($73M) - read-only reentrancy via reentrancy locks

**Key insight:** Even view functions can be dangerous if called during state updates

#### D. ERC-777/ERC-677 Hooks
- **Token transfer callbacks** - tokensReceived hook enables reentrancy
- **Reenter before state update** - CEI pattern violated
- **Example:** imBTC/Uniswap - ERC-777 reentrancy

**Mitigation:** Follow Checks-Effects-Interactions (CEI) pattern, use reentrancy guards, beware of token callbacks

---

### 4. Access Control Failures

**Why #4:** High impact, common in rushed deployments and upgrades

#### A. Unprotected Initialize
- **Front-run proxy initialization** - initialize() called by attacker first
- **Steal ownership/admin** - become contract owner/admin
- **Example:** Multiple proxy exploits - unprotected initializers

#### B. Missing Function Modifiers
- **Forgot onlyOwner on critical function** - privileged function left public
- **Public admin functions** - no access control on sensitive operations
- **Example:** Poly Network ($611M) - missing access control on cross-chain calls

#### C. Role Misconfiguration
- **Over-privileged roles** - roles have more permissions than needed
- **Missing role checks** - functions don't verify caller role
- **Example:** Various AccessControl bugs in OpenZeppelin implementations

#### D. Signature Replay
- **Missing nonce/deadline** - signatures can be reused
- **Cross-chain replay** - same signature valid on multiple chains
- **Example:** Multichain bridge attacks - signature replay across chains

**Mitigation:** Use OpenZeppelin's AccessControl, always include nonce/deadline in signatures, use EIP-712 typed signatures

---

### 5. Account Abstraction (ERC-4337) Vulnerabilities

**Emerging attack surface** as AA adoption grows

#### A. UserOperation Validation
- **Insufficient signature validation** - weak verification of UserOp signatures
- **Paymaster griefing** - drain paymaster funds via fake operations
- **Nonce management issues** - replay attacks via nonce manipulation

#### B. Bundler Attacks
- **MEV extraction** - bundlers reorder/censor UserOperations
- **Simulation vs execution mismatch** - different behavior in simulation vs actual execution
- **Gas griefing** - force high gas consumption in validation

#### C. Entry Point Exploits
- **Deposit theft** - exploit deposit/withdrawal mechanisms
- **Aggregator manipulation** - manipulate signature aggregation
- **Stake manipulation** - exploit staking/unstaking of paymasters/factories

**Resources:**
- [ERC-4337 Security Considerations](https://eips.ethereum.org/EIPS/eip-4337#security-considerations)
- [Account Abstraction Audit Guide](https://www.zellic.io/blog/erc-4337-security)

---

### 6. L2/Rollup Security Considerations

**Critical for rollup deployments**

#### A. Sequencer Failures
- **Sequencer downtime** - L2 sequencer offline but contracts accept transactions
- **Censorship resistance** - sequencer can censor specific transactions
- **Force inclusion mechanisms** - delayed L1 → L2 message forcing

#### B. L1 ↔ L2 Message Passing
- **Message replay** - same message executed multiple times
- **Message ordering** - out-of-order execution causing state issues
- **Proof window manipulation** - exploit fraud/validity proof timeframes

#### C. State Root Attacks
- **Unverified state roots** - accepting invalid state commitments
- **Withdrawal proofs** - forged Merkle proofs for withdrawals
- **Challenge period bypasses** - withdraw before challenge period ends

**L2-Specific Checks:**
- Always check L2 sequencer uptime before using price oracles
- Implement force inclusion paths for critical operations
- Verify message authenticity from L1 contracts
- Use appropriate timelock periods for L1 → L2 messages

---

### 7. Cross-Chain Bridge Vulnerabilities

**Why critical:** Single point of failure for billions in TVL

#### A. Signature Validation
- **Insufficient validators** - too few validators required for consensus
- **Validator collusion** - compromised validator set
- **Signature replay** - reuse signatures across chains

#### B. Message Verification
- **Weak Merkle proof verification** - accept invalid proofs
- **Missing finality checks** - accept unconfirmed transactions
- **Proof forgery** - craft fake proofs of cross-chain events

#### C. Token Minting/Burning
- **Mint without burn proof** - mint wrapped tokens without locking originals
- **Double spending** - mint on multiple chains from single deposit
- **Supply mismatch** - wrapped supply exceeds locked supply

#### D. Relayer Attacks
- **Relayer censorship** - refuse to relay specific messages
- **Message manipulation** - modify messages in transit
- **Gas griefing** - force high gas costs on destination chain

**Major Bridge Hacks:**
- Ronin Bridge ($625M) - validator key compromise
- Poly Network ($611M) - access control failure
- Wormhole ($326M) - signature verification bypass
- Nomad Bridge ($190M) - merkle root validation bug

**Mitigation Strategies:**
- Use threshold signatures (m-of-n validators)
- Implement time delays for large withdrawals
- Monitor supply consistency across chains
- Use optimistic verification with challenge periods
- Implement emergency pause mechanisms

---

## Audits

### Core Principle

- `timeboxing` - allocate a fixed, maximum amount of time and step out of the rabbit hole; move on. 

### Modern Auditing Checklist (Concise)

- **Invariants and state assertions**: identify core system invariants; add invariant tests/fuzzing.
- **Price/oracle safety**: TWAP usage, observation cardinality sizing, staleness/heartbeat checks, manipulation resistance.
- **AMM specifics**: concentrated liquidity range math, fee accounting, JIT exposure, LVR evaluation; hook integration for v4.
- **Auth/roles**: `onlyOwner`/roles scoping, upgrade paths, timelocks, pausability, guardian powers.
- **External calls**: CEI pattern, reentrancy coverage (including hooks/callbacks), pull over push flows.
- **Token standards**: ERC-20 quirks (fee-on-transfer, non-standard returns), ERC-721/1155 safety, ERC-4626 rounding and preview/convert alignment.
- **Economic sims**: liquidation thresholds, interest kink params, funding-rate logic for perpetual futures, auction/solver incentives for intents.
- **L2/L1 bridges**: replay protection, message ordering, proof windows, sequencer liveness checks.

### Auditing Strategy

1. **Find a project, search for bugs** - systematic review approach
2. **Find a bug, search for projects** - pattern-based hunting across codebases
3. **Be fast with new updates** - track latest EIPs, compiler versions, and protocol upgrades
4. **Know your tools** - master static analyzers, fuzzers, and formal verification

### Leading Auditors & Resources

Most auditor discussions are on Twitter:
- [Christoph Michel](https://learneos.dev/#packages) (#1 auditor on [Code4Arena](https://code4rena.com/leaderboard)) and [blog](https://cmichel.io/how-to-become-a-smart-contract-auditor/) mentions Khan A. for [Finance](https://www.khanacademy.org/economics-finance-domain/core-finance/derivative-securities))                   
- [Tincho](https://www.youtube.com/watch?v=A-T9F0anN1E&list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&index=5)
- [Pashov](https://twitter.com/pashovkrum) and [Pashov's audits](https://github.com/pashov/audits/tree/master/solo)   
- [Andy Li's road map](https://youtu.be/-469Gcye-ZE)
- [0kage.eth road map](https://twitter.com/0kage_eth/status/1640795980101742592?s=46&t=ezf5V_RX8d4d4zdIpUUrWQ)        
- [Owen Thurm's Channel](https://www.youtube.com/@0xOwenThurm)   
- [Dacian's blog](https://dacian.me/smart-contract-auditor-portfolio)
- [Addison Spiegel](https://addison.is/posts/curve-whitehat) Curve Finance White Hat
  - [Etherscan transaction](https://etherscan.io/tx/0x006763dff653ecddfd3681181a29e7e6d6c2aaa7bafb27fe1376f3f7ce367c1e)

---

## Testing & Verification

### Fuzzing (Dynamic Testing)

**Overview:** Automated testing technique that generates randomized inputs to discover unexpected behaviors, edge cases, and vulnerabilities.

#### Fuzzing Types

- **Stateless Fuzzing** - each run starts with fresh state, tests individual functions in isolation
- **Stateful Fuzzing** - maintains state between runs; final state of previous run is the starting state of the next run
- **Invariant Testing** - property-based testing that ensures system invariants always hold regardless of state transitions

#### Fuzzing Tools

- **[Echidna](https://github.com/crytic/echidna)** - property-based fuzzer (Haskell-based)
  - [Fuzzing guide](https://bushido-sec.com/index.php/2023/07/27/fuzzing-smart-contracts/)
  - Best for: complex invariants, custom test harnesses
  
- **[Medusa](https://github.com/crytic/medusa)** - coverage-guided fuzzer (Go-based)
  - Faster than Echidna with parallel workers
  - Better corpus management and mutation strategies
  
- **[Foundry Fuzzing](https://book.getfoundry.sh/forge/fuzz-testing)** - built into Foundry
  - Integrated with Solidity tests
  - Easy to set up for basic fuzzing

#### Best Practices

- Start with simple invariants (e.g., "total supply = sum of balances")
- Use stateful fuzzing for DeFi protocols
- Set appropriate run counts (10,000+ for thorough testing)
- Combine with symbolic execution for better coverage
- [Fuzzing Uniswap V4](https://www.youtube.com/live/CwvD8dmTsRc) - excellent real-world example

### Formal Verification

**Overview:** Mathematical proof that code satisfies a formal specification of its behavior.

#### Tools

- **[Certora](https://www.certora.com/)** - leading formal verification platform
  - CVL (Certora Verification Language) for specifications
  - Used by Aave, MakerDAO, Compound
  
- **[Halmos](https://github.com/a16z/halmos)** - symbolic testing tool for Foundry
  - Write properties in Solidity
  - Integrates with existing test suites
  
- **[K Framework](https://kframework.org/)** - formal semantics framework
  - Used for EVM formal verification
  - Supports multiple languages

#### When to Use Formal Verification

- Critical financial protocols (lending, derivatives)
- Complex state machines (governance, vesting)
- High-value targets (bridges, vaults)
- Contracts handling >$100M TVL

### Invariant Testing Best Practices

**Core Invariants to Test:**
- Assets ≥ Liabilities at all times
- Total shares × price per share = total assets
- Sum of user balances ≤ total supply
- Interest accrual monotonically increases
- No unauthorized minting/burning

**Protocol Phase Testing:**
- **Genesis**: initialization parameters, admin setup
- **Operation**: deposits, withdrawals, swaps, liquidations
- **Wind-down**: emergency pause, graceful shutdown, fund recovery

**Advanced Techniques:**
- **Shortcut Functions**: helper calls that leapfrog the protocol into complex or edge states to seed fuzzing contexts
- **Canary Flaws**: small, deliberately injected assertions that should never fire, alerting when a fuzzer reaches dangerous paths

---

## Bug Bounty Platforms

| Platform | Focus | Max Payout | Notable Features |
|----------|-------|------------|------------------|
| **[Code4rena](https://code4rena.com/)** | Competitive audits | $100K+ | Community-driven, leaderboard, detailed reports |
| **[Immunefi](https://immunefi.com/)** | Bug bounties | $10M+ | Largest crypto bug bounty platform, focus on critical vulnerabilities |
| **[Sherlock](https://www.sherlock.xyz/)** | Audit marketplace | Varies | Auditor staking, coverage underwriting |
| **[HackerOne](https://www.hackerone.com/)** | General security | Varies | Web2/Web3, established reputation system |
| **[Cantina](https://cantina.xyz/)** | Smart contract competitions | Varies | Curated security talent, private competitions |
| **[Secure3](https://secure3.io/)** | AI-assisted auditing | Varies | Combines human auditors with AI tools |

### Maximizing Bug Bounty Success

1. **Specialize** - focus on specific categories (oracle manipulation, access control, etc.)
2. **Speed matters** - be first to report duplicates
3. **Quality reports** - provide PoC, impact analysis, and remediation suggestions
4. **Build reputation** - consistent high-quality submissions lead to invites
5. **Stay current** - follow latest exploits and attack vectors

---

## AI-Assisted Security & Development

### AI Agent Skills

Pre-configured skills for AI assistants to help with smart contract development:

- **[Trail of Bits Skills](https://github.com/trailofbits/ask-questions-if-underspecified)** - clarify requirements before implementing
- **Custom audit prompts** - use AI to identify common vulnerability patterns
- **Code generation assistants** - Claude, ChatGPT with security-focused prompts

### Model Context Protocol (MCP) Servers

MCP enables AI assistants to interact with development tools:

- **[Slither MCP](https://github.com/crytic/slither)** - run Slither static analysis directly from AI chat
- **Foundry integration** - test generation and execution via AI
- **Documentation generation** - auto-generate NatSpec and README files

---

## DeFi Security Best Practices

### Common Attack Vectors

- **[Slippage Attacks](https://dacian.me/defi-slippage-attacks)** - exploiting insufficient slippage protection
- **[Block Stuffing](https://www.youtube.com/watch?v=3aPYkx7G7e0)** - filling blocks to prevent liquidations ([C4 example](https://github.com/code-423n4/2023-05-venus-findings/issues/525))
- **Liquidation Attacks** - forcing undercollateralized positions
- **Price Oracle Manipulation** - flash loan attacks on spot price oracles
- **Reentrancy** - read-only reentrancy, cross-function reentrancy
- **JIT Liquidity Sniping** - MEV extraction via just-in-time liquidity (Uniswap V3/V4)

### Practical Resources

- **[Build a Liquidation Bot](https://docs.aave.com/faq/liquidations)** ([video](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=72020))
- **[DeFi Security Best Practices](https://consensys.github.io/smart-contract-best-practices/)** (ConsenSys)
- **[Aave Architecture](https://twitter.com/RareSkills_io/status/1687116196343406594)** - decoupling logic from state for upgradability

---

[← Back to Main](../README.md) | [Next: DeFi Guide →](defi.md)
