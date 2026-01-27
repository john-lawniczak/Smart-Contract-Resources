# DeFi (Decentralized Finance) Guide

**Last verified: 2026-01**

---

## Overview

**Key concepts:** AMM · TWAPs · JIT liquidity · RFQ · DLOB · perpetual futures · observation cardinality · Slots and epochs · MEV

---

## DeFi Analytics & Tracking

- [DeFi Llama](https://defillama.com/) - comprehensive TVL and protocol analytics
- [L2Beat](https://l2beat.com/scaling/tvl) - Layer 2 ecosystem tracking and risk analysis
- [Eigenphi](https://eigenphi.io/) - MEV and on-chain data analytics
- [DeFi vs TradeFi explainer](https://coinstove.com/learn/defi-vs-tradfi/)

---

## Learning Resources

### DeFi Lending Deep Dives (3-part series)
- [Part 1: Lending and Borrowing](https://blog.smlxl.io/defi-lending-concepts-part-1-lending-and-borrowing-f646d6a08dd7)
- [Part 2: Liquidations](https://blog.smlxl.io/defi-lending-concepts-part-2-liquidations-7f0f0ffec96c)
- [Part 3: Rewards](https://medium.com/smlxl/defi-lending-concepts-part-3-rewards-2fc87e78e9c4)

### General Resources
- [Teach Yourself Crypto - DeFi Module](https://teachyourselfcrypto.com/#ftoc-module-4-decentralized-finance-defi)
- [Khan Academy - Banking Fundamentals](https://www.khanacademy.org/economics-finance-domain/core-finance/money-and-banking/banking-and-money/v/banking-1)

---

## Decentralized Exchanges (DEXs)

### Major AMM DEXs

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

### Order Book DEXs

| Protocol | Chain | Type | Key Features |
|----------|-------|------|--------------|
| **[dYdX V4](https://dydx.exchange/)** | Cosmos app-chain | Orderbook + perps | Fully decentralized orderbook, off-chain matching, on-chain settlement |
| **[Vertex](https://vertexprotocol.com/)** | Arbitrum | Hybrid | Combines AMM + orderbook, integrated perps and spot |
| **[Hyperliquid](https://hyperliquid.xyz/)** | Custom L1 | Orderbook + perps | High-performance L1 for trading, sub-second finality |

### DEX Aggregators

Route trades across multiple DEXs to find best execution:
- **[1inch](https://1inch.io/)** - pathfinder algorithm, limit orders, gas optimization ([video](https://www.youtube.com/watch?v=BpcP0n44Tf8))
- **[Paraswap](https://www.paraswap.io/)** - multi-path routing, gas refunds
- **[CoW Swap](https://cow.fi/)** - MEV-protected trading via batch auctions and solvers
- **[Matcha](https://matcha.xyz/)** - 0x protocol aggregator

---

## Lending & Borrowing Protocols

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

## Liquid Staking & Restaking

| Protocol | Type | Token | Key Features |
|----------|------|-------|--------------|
| **[Lido](https://lido.fi/)** | Liquid staking | stETH | Largest ETH staking protocol, ~30% of staked ETH ([video](https://www.youtube.com/watch?v=VQ_uvak1JPw)) |
| **[Rocket Pool](https://rocketpool.net/)** | Liquid staking | rETH | Decentralized node operators, trustless |
| **[EigenLayer](https://www.eigenlayer.xyz/)** | Restaking | - | Restake ETH to secure other protocols (AVSs), additional yield |
| **[Frax Ether](https://frax.finance/)** | Liquid staking | frxETH/sfrxETH | Dual-token system, higher yields via validators |

---

## Derivatives & Perpetuals

| Protocol | Type | Key Features |
|----------|------|--------------|
| **[GMX](https://gmx.io/)** | Perps | Zero-slippage, up to 50x leverage, GLP liquidity pool |
| **[dYdX](https://dydx.exchange/)** | Perps + spot | Decentralized orderbook, off-chain matching |
| **[Synthetix](https://synthetix.io/)** | Synthetic assets | SNX collateral, infinite liquidity, cross-margin perps |
| **[Gains Network](https://gains.trade/)** | Perps | Leverage up to 150x (forex/crypto), DAI collateral |
| **[Hyperliquid](https://hyperliquid.xyz/)** | Perps | High-performance L1, HLP liquidity, sub-second settlement |

### Other Derivatives
- **[UMA](https://uma.xyz/)** - optimistic oracle for synthetic assets and insurance
- **[Lyra](https://www.lyra.finance/)** - options trading (calls/puts)
- **[Dopex](https://www.dopex.io/)** - decentralized options

---

## DeFi Key Terms & Concepts

### Financial Metrics
- **APY** - [Annual Percentage Yield](https://www.investopedia.com/terms/a/apy.asp) - includes compound interest
- **APR** - Annual Percentage Rate - simple interest without compounding
- **LTV** - [Loan To Value](https://www.investopedia.com/terms/l/loantovalue.asp) ratio - collateral value / loan value
- **Health Factor** - ratio of collateral to debt; below 1.0 triggers liquidation (Aave term)
- **Utilization Rate** - percentage of available liquidity currently borrowed
- **PnL** - Profit and Loss

### Participants
- **LP** - Liquidity Providers - users who deposit assets into liquidity pools
- **LST** - Liquid Staking Token (e.g., stETH, rETH) - represents staked ETH
- **LRT** - Liquid Restaking Token (e.g., EigenLayer) - represents restaked assets

### Trading Mechanisms
- **Order Book Model** - electronic list of buy/sell orders organized by price level
- **AMM** (Automated Market Maker) - algorithmic market maker using liquidity pools and pricing curves
- **CPMM** ([Constant Product Market Maker](https://www.youtube.com/watch?v=QNPyFs8Wybk)) - AMM using formula `x*y=k` (Uniswap V1/V2)
- **CSMM** - Constant Sum Market Maker (`x+y=k`) - maintains 1:1 price, ideal for like-assets
- **Stableswap** - Hybrid curve (Curve Finance) combining CPMM + CSMM for low-slippage stablecoin swaps
- **Concentrated Liquidity** - LPs provide liquidity within custom price ranges (Uniswap V3+)

### Infrastructure
- **Relayer** - off-chain participant that matches orders and facilitates on-chain settlement

### Risk Parameters
- **Liquidity Threshold** - minimum liquidity needed for efficient market function
- **Liquidation Threshold** - collateral:debt ratio that triggers liquidation (typically 80-85%)
- **Liquidation Penalty** - fee charged during liquidation (typically 5-15%)
- **Kink Parameter** - inflection point in interest rate models where rates shift from linear to exponential

### Token Economics
- **Bonding Curve** - mathematical function defining token price based on supply
- **CDP (Collateralized Debt Position)** - accounting unit tracking borrowed debt and backing collateral

---

## Modern DeFi Trends (2025-2026)

### Real-World Asset (RWA) Tokenization
- Tokenization of treasuries, bonds, real estate, commodities on-chain
- Protocols: [Ondo Finance](https://ondo.finance/) (USDY), [Centrifuge](https://centrifuge.io/), [Maple Finance](https://maple.finance/)
- Regulatory clarity improving in US, EU, Singapore, UAE

### Restaking & Shared Security
- **[EigenLayer](https://www.eigenlayer.xyz/)** - restake ETH to secure additional protocols (AVSs)
- **[Symbiotic](https://symbiotic.fi/)** - modular restaking protocol
- **[Karak](https://karak.network/)** - multi-asset restaking
- Enables protocols to leverage Ethereum's security without own validator sets

### Intent-Based Architectures
- Users express desired outcomes (e.g., "swap X for Y at best price within 5 min")
- Solvers compete to fulfill intents via auctions
- Protocols: [CoW Protocol](https://cow.fi/), [UniswapX](https://uniswap.org/), [1inch Fusion](https://1inch.io/fusion/)
- Benefits: MEV protection, better execution, gasless transactions

### Account Abstraction (ERC-4337)
- Smart contract wallets with programmable logic
- Features: social recovery, session keys, gas sponsorship, batched transactions
- Implementations: [Safe](https://safe.global/), [Biconomy](https://www.biconomy.io/), [ZeroDev](https://zerodev.app/)
- EIP-7702 (Pectra upgrade) enables EOAs to temporarily act like smart contracts

### Cross-Chain & Interoperability
- Unified liquidity and messaging across chains
- Bridges: [LayerZero](https://layerzero.network/), [Axelar](https://axelar.network/), [Wormhole](https://wormhole.com/)
- Aggregators: [LI.FI](https://li.fi/), [Socket](https://socket.tech/), [Squid](https://www.squidrouter.com/)
- Focus on security post-bridge hacks (Ronin, Poly Network, Wormhole)

### AI + DeFi
- AI-powered portfolio management and trading strategies
- Autonomous agents for governance participation
- Automated security monitoring and anomaly detection
- Natural language interfaces for DeFi interactions

### Privacy & Compliance
- Zero-knowledge proofs for private transactions
- Selective disclosure for regulatory compliance
- Protocols: [Aztec](https://aztec.network/), [Railgun](https://railgun.org/)
- Balance between privacy rights and AML/KYC requirements

---

## Uniswap Versions 1-4

### Uniswap V1
- Only ETH/token pairs
- Simple constant product (x * y = k) AMM
- Minimal design and functionality

### Uniswap V2
- Supports ERC20/ERC20 pairs
- Introduced flash swaps
- Added built-in price oracles and improved LP token functionality

### Uniswap V3
- Concentrated liquidity, allowing LPs to specify custom price ranges
- Multiple fee tiers for improved capital efficiency
- Enhanced customization and capital utilization for liquidity providers
- See also: JIT liquidity, observation cardinality, TWAPs

### Uniswap V4
- Modular and composable architecture with plug-and-play **hooks**
- Further improvements in gas efficiency and capital optimization with ERC-6909
- More flexible fee structures and integration enhancements
- **Hooks:**  
  - beforeInitialize, afterInitialize
  - beforeAddLiquidity, afterAddLiquidity
  - beforeRemoveLiquidity, afterRemoveLiquidity
  - beforeSwap, afterSwap
  - beforeDonate, afterDonate
- **Key Features:**
  - ERC-6909 (Singleton multi-token standard)
  - Singleton architecture
  - Flash accounting (token debits/credits netted before settlement)
- See also: JIT liquidity, RFQ, DLOB

### Fuzzing Uniswap V4
- [Video walkthrough](https://www.youtube.com/live/CwvD8dmTsRc)
- **Core Invariant**: Assets ≥ Liabilities (A ≥ L) at any point
- **Protocol Phases**:
  - Genesis: deployment & initial parameters
  - Operation: normal user flows (deposits, swaps, liquidations)
  - Wind-down: emergency exits, pauses, graceful shutdown
- **Advanced Techniques**:
  - Shortcut Functions: helper calls to reach complex states
  - Canary Flaws: deliberately injected assertions to detect dangerous paths

---

## DeFi Security & Attack Vectors

### Common DeFi Attack Patterns
- **[Slippage Attacks](https://dacian.me/defi-slippage-attacks)** - exploiting insufficient slippage protection in swaps
- **[Block Stuffing](https://www.youtube.com/watch?v=3aPYkx7G7e0)** - filling blocks to prevent liquidation protection ([C4 finding](https://github.com/code-423n4/2023-05-venus-findings/issues/525))
- **Liquidation Attacks** - forcing undercollateralized positions for profit
- **Price Oracle Manipulation** - flash loan attacks on spot price oracles
- **Reentrancy in DeFi** - read-only reentrancy, cross-function reentrancy
- **JIT Liquidity Sniping** - MEV extraction via just-in-time liquidity provision (Uniswap V3)

### DeFi-Specific Testing
**Invariant Properties to Test:**
- Assets ≥ Liabilities at all times
- Total shares × price per share = total assets
- Sum of user balances ≤ total supply
- Interest accrual monotonically increases
- No unauthorized minting/burning

**Protocol Phase Testing:**
- Genesis: initialization parameters, admin setup
- Operation: deposits, withdrawals, swaps, liquidations
- Wind-down: emergency pause, graceful shutdown, fund recovery

### Practical Resources
- **[Build a Liquidation Bot](https://docs.aave.com/faq/liquidations)** ([video](https://youtu.be/gyMwXuJrbJQ?list=PLQj6KMbjsRt7ft3xEtU8WhkK5-TsxDplY&t=72020))
- **[Aave Architecture](https://twitter.com/RareSkills_io/status/1687116196343406594)** - decoupling logic from state for upgradability
- **[DeFi Security Best Practices](https://consensys.github.io/smart-contract-best-practices/)** (ConsenSys)

---

## MEV (Maximal Extractable Value)

**Definition:** The maximum value that can be extracted from block production beyond the standard block reward and gas fees, by including, excluding, or reordering transactions within a block.

### Modern MEV Architecture (Post-Merge)

After Ethereum's transition to Proof-of-Stake, MEV extraction shifted from miners to validators/block proposers. The ecosystem now operates with **Proposer-Builder Separation (PBS)**:

- **Block Builders**: Specialized actors who construct blocks by ordering transactions to maximize MEV
- **Block Proposers** (Validators): Choose the most profitable block from builders via [MEV-Boost](https://boost.flashbots.net/)
- **Searchers**: Identify MEV opportunities and submit bundles to builders
- This separation professionalizes MEV extraction while allowing validators to earn without sophisticated infrastructure

Per *[Mastering Ethereum (2nd Edition)](https://masteringethereum.xyz/)*, this architecture reduces centralization risks by separating block construction from block proposal.

### Common MEV Attack Types

- **Sandwich Attacks**: Front-run and back-run a victim's transaction to profit from price slippage
- **Front-running**: Submit a transaction with higher gas to execute before a known pending transaction
- **Back-running**: Execute immediately after a target transaction to capitalize on state changes
- **Arbitrage**: Exploit price differences across DEXs or within the same block
- **Liquidations**: Monitor lending protocols to liquidate undercollateralized positions for profit
- **Uncle-block Attack** - **Historical (PoW only)**: Eliminated in Ethereum PoS (post-Merge, Sept 2022)

### MEV Protection Strategies

- Use **private transactions** via [Flashbots Protect](https://docs.flashbots.net/flashbots-protect/overview)
- Set **minimum return amounts** with appropriate slippage tolerance in DEX swaps
- Implement **commit-reveal schemes** for sensitive transactions
- Use **MEV-resistant protocols** (e.g., CowSwap, Eden Network)
- **Batch transactions** to reduce MEV surface area

### MEV Resources

- [Ethereum.org MEV docs](https://ethereum.org/en/developers/docs/mev/)
- [Flashbots documentation](https://docs.flashbots.net/)
- [MEV research forum](https://collective.flashbots.net/)
- [MEV video explainer](https://youtu.be/u4sV-Btg1Ag)

---

## Stablecoins

### Types of Stablecoins

1. **Fiat-Collateralized** (centralized, 1:1 reserves)
   - USDC (Circle), USDT (Tether), BUSD (Binance/Paxos)
   - Pros: stable, liquid, trusted by institutions
   - Cons: centralization, counterparty risk, freeze/blacklist functions

2. **Crypto-Collateralized** (overcollateralized)
   - DAI (MakerDAO), LUSD (Liquity), sUSD (Synthetix)
   - Pros: decentralized, transparent, censorship-resistant
   - Cons: capital inefficient, liquidation risk, complexity

3. **Algorithmic** (under/uncollateralized)
   - Historical: UST (Terra/Luna - failed May 2022), AMPL (Ampleforth)
   - Modern: FRAX (partially algorithmic), RAI (floating peg)
   - Pros: capital efficient, purely on-chain
   - Cons: high risk of death spiral, peg instability

### Stablecoin Risks

- **De-peg events**: Loss of 1:1 parity with target asset
- **Oracle manipulation**: Flash loan attacks on price feeds
- **Redemption runs**: Bank-run dynamics in stressed markets
- **Regulatory risk**: Potential future restrictions or requirements
- **Smart contract risk**: Bugs in minting/burning logic

### Oracle Security for Stablecoins

- **Use Chainlink Price Feeds** with:
  - Heartbeat checks (staleness detection)
  - Deviation thresholds
  - Multiple oracle sources
  - Circuit breakers for extreme price movements
  
- **TWAP (Time-Weighted Average Price)**:
  - Protects against flash loan manipulation
  - Requires sufficient observation cardinality
  - Trade-off: slower to reflect real price changes
  
- **Fallback mechanisms**:
  - Multiple oracle sources (Chainlink + Uniswap TWAP)
  - Manual pause/freeze during oracle failures
  - Governance override for extreme scenarios

### Notable Stablecoin Incidents

- **UST/Luna Collapse (May 2022)**: $40B+ algorithmic stablecoin death spiral
- **USDC Depeg (March 2023)**: Brief depeg due to Silicon Valley Bank exposure
- **DAI Peg Issues**: Various temporary depegs during market stress

---

[← Back to Main](../README.md) | [Next: Finance Reading →](finance-reading.md)
