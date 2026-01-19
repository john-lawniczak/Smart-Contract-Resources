# Damn Vulnerable DeFi - Foundry Version (v4.1.0)

A collection of vulnerable smart contracts from [Damn Vulnerable DeFi](https://www.damnvulnerabledefi.xyz/) by [The Red Guild](https://github.com/theredguild/damn-vulnerable-defi).

## About

Damn Vulnerable DeFi is a set of challenges to learn offensive security of DeFi smart contracts in Ethereum. Each challenge presents a different vulnerability scenario based on real-world DeFi exploits.

## Version

**v4.1.0** - Cloned from: https://github.com/theredguild/damn-vulnerable-defi/tree/v4.1.0

## Challenges Included

### 1. **Unstoppable** - DoS attacks on lending pools
- Flash loan vault that can be broken

### 2. **Naive Receiver** - Improper access controls
- Flash loan receiver vulnerable to unauthorized calls
- Includes meta-transaction (EIP-2771) patterns

### 3. **Truster** - Improper use of external calls
- Lending pool with dangerous approval patterns

### 4. **Side Entrance** - Accounting vulnerabilities
- Flash loan pool with flawed balance tracking

### 5. **The Rewarder** - Reward distribution exploits
- Token distribution vulnerabilities
- Includes Merkle proof distribution system

### 6. **Selfie** - Governance attacks
- Snapshot-based governance exploitation
- Flash loan + governance combination

### 7. **Compromised** - Oracle manipulation
- Price oracle vulnerabilities
- Exchange manipulation via compromised price feeds

### 8. **Puppet** - Uniswap V1 price manipulation
- Oracle manipulation using Uniswap V1 spot prices

### 9. **Puppet V2** - Uniswap V2 price manipulation
- Oracle manipulation using Uniswap V2 TWAP

### 10. **Puppet V3** - Uniswap V3 price manipulation
- Oracle manipulation with concentrated liquidity

### 11. **Free Rider** - NFT marketplace exploits
- Vulnerable NFT marketplace
- NFT recovery manager patterns

### 12. **Backdoor** - Wallet registry vulnerabilities
- Gnosis Safe wallet registry exploitation

### 13. **Climber** - Timelock bypass
- Complex timelock and vault upgrade vulnerabilities

### 14. **Wallet Mining** - CREATE2 and deterministic addresses
- Wallet deployment vulnerabilities
- Authorizer factory patterns

### 15. **ABI Smuggling** - ABI encoding attacks
- Function selector collision
- Calldata manipulation

### 16. **Shards** - NFT fractionalization
- NFT marketplace with sharding vulnerabilities

### 17. **Curvy Puppet** - Curve Finance integration
- Curve pool manipulation
- Complex DeFi oracle attacks

### 18. **Withdrawal** - Cross-chain bridge vulnerabilities
- L1/L2 bridge exploitation
- Message passing vulnerabilities

## Core Token Contracts

- **DamnValuableToken.sol** - Standard ERC20 token used across challenges
- **DamnValuableNFT.sol** - Standard ERC721 NFT used in various challenges
- **DamnValuableVotes.sol** - ERC20Votes token for governance challenges
- **DamnValuableStaking.sol** - Staking contract used in challenges

## Structure

Each challenge directory contains:
- `README.md` - Challenge description and objectives
- Smart contract source files
- Related interface and library files

## Learning Objectives

These contracts demonstrate common DeFi vulnerabilities including:
- Flash loan attacks
- Oracle manipulation
- Access control issues
- Reentrancy vulnerabilities
- Governance attacks
- Cross-contract interactions
- Price manipulation
- ABI encoding issues
- Upgrade pattern vulnerabilities
- Cross-chain bridge exploits

## Usage

These contracts are for **educational purposes only**. Study the vulnerabilities, understand the attack vectors, and learn how to properly secure DeFi protocols.

## Resources

- [Official Damn Vulnerable DeFi Website](https://www.damnvulnerabledefi.xyz/)
- [The Red Guild GitHub](https://github.com/theredguild)
- [Original Repository](https://github.com/theredguild/damn-vulnerable-defi)

## License

See original repository for license information.
