# Smart Contract Resources

A comprehensive, curated collection of EVM development resources, security tools, DeFi protocols, and vulnerable contract examples for learning and auditing.

**Last verified: 2026-01**

---

## Documentation

This repository is organized into focused guides for easy navigation:

### Getting Started
- **[Getting Started Guide](docs/getting-started.md)** - Essential documentation, learning resources, development environments, and tooling

### Core Development Topics
- **[Ethereum Consensus & EVM](docs/ethereum-consensus.md)** - Proof-of-Stake consensus, validators, nodes, EVM architecture, and block production (based on Mastering Ethereum 2nd Ed)
- **[EVM Internals: Memory, Storage & Opcodes](docs/memory-storage-opcodes.md)** - Deep dive into memory layout, storage architecture, opcode reference with gas costs, and optimization techniques
- **[Transactions & Signatures](docs/transactions.md)** - Transaction types (EIP-2718), ECDSA signatures, and transaction mechanics
- **[Token Standards](docs/tokens.md)** - EIP vs ERC distinction, ERC-20, ERC-721, ERC-1155, ERC-4626, and other token standards

### Security & Auditing
- **[Security & Testing](docs/security.md)** - Attack vectors, audit resources, testing strategies, fuzzing, formal verification, bug bounty platforms, and AI-assisted security tools

### DeFi Ecosystem
- **[DeFi Guide](docs/defi.md)** - Comprehensive guide to decentralized finance: DEXs, lending protocols, derivatives, stablecoins, MEV, and modern DeFi trends (2025-2026)

### Professional Development
- **[Reading List](docs/finance-reading.md)** - Books on Web3 security, traditional finance parallels, and market manipulation
- **[Deployment & Wallets](docs/deployment-wallets.md)** - Contract deployment commands and wallet options (browser, mobile, hardware, smart contract)
- **[Career Resources](docs/career.md)** - Security firms, development teams, and job boards

### Reference Materials
- **[Glossary](docs/glossary.md)** - Comprehensive dictionary of Solidity and DeFi terms
- **[Contract Layout Guide](docs/contract-layout.md)** - Best practices for organizing Solidity code
- **[Whitepapers & Research](docs/abstracts.md)** - Foundational papers and academic resources

---

## Repository Contents

### Source Code Examples

#### Damn Vulnerable DeFi (Foundry)
The `src/damn-vulnerable-defi-foundry/` directory contains vulnerable smart contract examples for learning security:

- **Flash Loan Challenges**: unstoppable, truster, side-entrance, the-rewarder
- **Oracle Manipulation**: compromised, puppet, puppet-v2, puppet-v3
- **Governance Attacks**: selfie, climber
- **NFT & Marketplace**: free-rider, shards
- **Advanced DeFi**: naive-receiver, backdoor, wallet-mining, curvy-puppet, abi-smuggling, withdrawal

Each challenge includes a README.md with vulnerability descriptions and learning objectives.

#### Real-World Exploited Contracts
The `src/real-world-exploits/` directory contains references to actual exploits with postmortems:

- **2024**: Orbit Bridge ($82M), Radiant Capital ($50M), Shezmu ($4.9M)
- **2023**: Euler Finance ($197M), Mango Markets ($110M), Nomad Bridge ($190M)
- **2022**: Ronin Bridge ($625M), Wormhole ($326M), Poly Network ($611M)
- **Historical**: The DAO ($60M), Yearn Finance, Cream Finance, BadgerDAO

See **[Real-World Exploits](src/real-world-exploits/README.md)** for detailed analysis, vulnerable code, and lessons learned.

#### Yul Contracts
The `src/yul-contracts/` directory contains examples of Yul (inline assembly) for gas optimization and low-level EVM programming.

---

## Contributing

This is a living resource. Contributions, corrections, and suggestions are welcome! Please ensure:
- Links are current and functional
- New resources add clear value
- Content includes verification dates when applicable

---

## License

This resource collection is provided for educational purposes. Individual resources and links maintain their own licenses.

---

## Quick Links

- [Ethereum Developer Docs](https://ethereum.org/en/developers/docs/)
- [Solidity Documentation](https://docs.soliditylang.org/)
- [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/)
- [Foundry Book](https://book.getfoundry.sh/)
- [RareSkills Blog](https://www.rareskills.io/blog)
