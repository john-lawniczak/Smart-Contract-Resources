# Token Standards

**Last verified: 2026-01**

---

## EIP vs ERC: Understanding the Difference

### What's the Difference?

**EIP (Ethereum Improvement Proposal)** is a design document proposing upgrades, improvements, or new features to the Ethereum protocol itself. EIPs provide technical specifications and rationale for changes to the network.

**ERC (Ethereum Request for Comment)** is a specific **category** of EIP focused on **application-level standards**, particularly for smart contracts, tokens, and DApp interactions.

> **Key insight**: Every ERC is an EIP, but not every EIP is an ERC.

### Protocol Layer vs Application Layer

| Aspect | EIP (Protocol Layer) | ERC (Application Layer) |
|--------|---------------------|------------------------|
| **Scope** | Ethereum core protocol | Smart contract standards |
| **Created by** | Core developers, researchers | Smart contract developers, community |
| **Requires** | Network hard fork (for Core EIPs) | No network changes needed |
| **Affects** | Node software, consensus rules, EVM | DApps, tokens, wallets |
| **Examples** | EIP-1559 (fee market), EIP-4844 (blobs) | ERC-20 (tokens), ERC-721 (NFTs) |
| **Implementation** | All nodes must upgrade | Optional adoption by developers |

### EIP Categories

1. **Core** - Changes to the Ethereum protocol (consensus, EVM, networking)
   - Example: EIP-1559 (base fee + priority fee), EIP-3855 (PUSH0 opcode)
   
2. **Networking** - P2P networking specifications
   - Example: EIP-2464 (eth/65 protocol), EIP-2481 (eth/66 protocol)
   
3. **Interface (ERC)** - Application-level standards
   - Example: ERC-20 (tokens), ERC-721 (NFTs), ERC-4626 (vaults)
   
4. **Meta** - Processes, guidelines, or information
   - Example: EIP-1 (EIP purpose and guidelines)

### Real-World Distinction

**Protocol change (EIP)**: EIP-1559 changed how gas fees work - required all nodes to upgrade
- Introduced base fee (burned) + priority fee (to validator)
- Hard fork: London (August 2021)
- Impact: Every transaction on Ethereum

**Application standard (ERC)**: ERC-20 defined token interface
- Standardized `transfer`, `approve`, `balanceOf` functions
- No hard fork needed
- Impact: Only DApps/tokens that choose to implement it

### Why This Matters for Developers

**When building:**
- **ERC standards** - You can adopt immediately, no waiting for network upgrades
- **EIP protocol changes** - You must wait for hard forks and update your contracts accordingly

**Security implications:**
- ERC standards can have vulnerabilities at the application level (e.g., approval front-running)
- EIP changes can introduce protocol-level risks (e.g., consensus bugs)

**Reference**: "Mastering Ethereum, 2nd Edition" - Appendix: EIP and ERC Standards

---

## Ethereum Request for Comment (ERC)

> Application-level standards for smart contracts and tokens

### Core Token Standards

#### ERC-20 - Fungible Token Standard

- **[ERC-20](https://ethereum.org/en/developers/docs/standards/tokens/erc-20/)** - standard for fungible assets (USDC, DAI, LINK, etc.)
- Most widely used token standard
- Core functions: `transfer`, `approve`, `transferFrom`, `balanceOf`, `totalSupply`

**Common issues:**
- Non-standard return values (some tokens return `false` instead of reverting)
- Fee-on-transfer tokens
- Rebasing tokens
- Deflationary/inflationary mechanisms

---

#### ERC-721 - Non-Fungible Token (NFT) Standard

- **[ERC-721](https://docs.openzeppelin.com/contracts/2.x/api/token/erc721)** - standard for non-fungible assets (unique items, NFTs)
- Each token is unique with its own tokenId
- Core functions: `ownerOf`, `transferFrom`, `safeTransferFrom`, `approve`, `setApprovalForAll`

**Key considerations:**
- Use `safeTransferFrom` to ensure recipient can handle NFTs
- Implement `onERC721Received` in contracts that receive NFTs
- Be aware of approval phishing attacks

---

#### ERC-1155 - Multi Token Standard

- **[ERC-1155](https://ethereum.org/en/developers/docs/standards/tokens/erc-1155/)** - combines fungible and non-fungible tokens in a single contract
- Efficient for gaming, batch minting, batch transfers
- Single contract can manage multiple token types
- Supports batch operations for gas efficiency
- [Video explanation](https://www.youtube.com/watch?v=Ai7A-_umm08)

**Use cases:**
- Gaming items (fungible potions + unique weapons)
- Digital collectibles with editions
- Reducing deployment costs for multiple token types

---

### Advanced Token Standards

#### ERC-4626 - Tokenized Vault Standard

- **[ERC-4626](https://ethereum.org/en/developers/docs/standards/tokens/erc-4626/)** - standardized vault interface for yield-bearing tokens
- Optimizes and unifies technical parameters of vaults
- Used by: Yearn, Balancer, Compound V3, Aave V3

**Key functions:**
- `deposit` / `mint` - deposit assets, receive shares
- `withdraw` / `redeem` - burn shares, receive assets
- `previewDeposit` / `previewWithdraw` - simulate operations
- `totalAssets` - total underlying assets

**Security considerations:**
- Rounding direction (favor protocol or user?)
- First depositor attack mitigation
- Share price manipulation
- Preview function accuracy

---

#### ERC-2612 - Permit (Gasless Approvals)

- **[ERC-2612](https://eips.ethereum.org/EIPS/eip-2612)** - permit extension for ERC-20 tokens
- Enables gasless approvals via off-chain signatures
- No transaction needed for `approve()`
- Reduces UX friction in DeFi

**How it works:**
1. User signs permit message off-chain
2. Spender submits permit + transfer in single transaction
3. Eliminates separate approve transaction

**Security notes:**
- Verify deadline parameter
- Check nonce to prevent replay attacks
- Be aware of signature malleability

---

#### ERC-3156 - Flash Loans

- **[ERC-3156](https://eips.ethereum.org/EIPS/eip-3156)** - standardized flash loan interface
- Defines lender and borrower interfaces
- Used by: Aave, Uniswap V3, Balancer

**Key components:**
- `flashLoan` - borrow assets temporarily
- `onFlashLoan` - callback for borrower logic
- Assets must be returned in same transaction + fee

---

### Specialized Standards

#### ERC-2981 - NFT Royalty Standard

- **[ERC-2981](https://eips.ethereum.org/EIPS/eip-2981)** - retrieve royalty payment information for NFTs
- Allows creators to earn royalties on secondary sales
- Works across all NFT marketplaces and ecosystem participants

**Limitations:**
- Not enforceable on-chain (marketplace must implement)
- Some marketplaces ignore royalties (e.g., Blur, X2Y2)

---

#### ERC-1167 - Minimal Proxy Contract

- **[ERC-1167](https://eips.ethereum.org/EIPS/eip-1167)** - minimal proxy clone pattern
- Cheaply clone contract functionality in an immutable way
- Reduces gas costs for deploying similar contracts

**Use cases:**
- Factory patterns (Gnosis Safe, Uniswap pairs)
- Deploying many similar contracts
- ~10x cheaper deployment than full contract

---

### Other Standards

- **ERC-918** - Mineable Token Standard (PoW tokens)
- **ERC-165** - Standard method to publish and detect interfaces
- **ERC-725** - Interface for a simple proxy account
- **ERC-173** - Interface for ownership of contracts

---

## NFTs & Atomic NFTs

- [NFT Lecture with Ari Juels](https://youtu.be/tVyS3Ut_1eE?t=2535) - deep dive into NFT mechanics and atomic NFTs
- Ari Juels and Sergey Nazarov co-authored the [Chainlink whitepaper](https://en.wikipedia.org/wiki/Chainlink_(blockchain))

---

## Token Security Best Practices

### For Token Creators

1. **Follow established standards** - don't create custom interfaces
2. **Test thoroughly** - especially approval and transfer mechanisms
3. **Consider upgradeability** - use proxy patterns if updates are needed
4. **Document deviations** - if implementing non-standard behavior
5. **Get audited** - especially for tokens with novel mechanisms

### For Token Users/Developers

1. **Check for standard compliance** - verify expected functions exist
2. **Handle non-standard returns** - use OpenZeppelin's SafeERC20
3. **Be aware of special tokens**:
   - Fee-on-transfer (e.g., STA, PAXG)
   - Rebasing (e.g., AMPL, OHM)
   - Blacklistable (e.g., USDC, USDT)
4. **Test with multiple tokens** - don't assume all ERC-20s behave the same

---

[← Back to Main](../README.md) | [Next: Glossary →](glossary.md)
