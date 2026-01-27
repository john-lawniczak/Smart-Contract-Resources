# Repository Organization Guide

**Last updated: 2026-01**

This document provides an overview of the repository structure and how to navigate the Smart Contract Resources collection.

---

## Repository Statistics

- **Total Documentation**: ~3,575 lines across 14 markdown files
- **Main Sections**: 13 focused guides
- **Vulnerability Categories**: 7 ranked attack types
- **Real-World Exploits**: 15+ documented incidents with postmortems
- **Practice Contracts**: 20+ vulnerable contract challenges
- **Glossary Terms**: 100+ definitions with cross-references

---

## Navigation Map

### Quick Start Paths

#### **For Beginners**
1. Start: [Getting Started Guide](docs/getting-started.md)
2. Learn basics: [Contract Layout](docs/contract-layout.md)
3. Understand security: [Security & Testing](docs/security.md)
4. Practice: [Damn Vulnerable DeFi](src/damn-vulnerable-defi-foundry/)

#### **For Auditors**
1. Review: [Top 7 Vulnerabilities](docs/security.md#top-vulnerability-categories-ranked-by-impact)
2. Study: [Real-World Exploits](src/real-world-exploits/README.md)
3. Reference: [Web3 Exploits Checklist](src/web3-exploits.md)
4. Tools: [Security Tools](docs/getting-started.md#fuzzing--dynamic-analysis)

#### **For Protocol Developers**
1. Architecture: [Ethereum Consensus & EVM](docs/ethereum-consensus.md)
2. Optimization: [Memory, Storage & Opcodes Guide](docs/memory-storage-opcodes.md)
3. DeFi patterns: [DeFi Guide](docs/defi.md)
4. Standards: [Token Standards](docs/tokens.md)

#### **For Researchers**
1. Technical depth: [Ethereum Consensus](docs/ethereum-consensus.md)
2. Academic papers: [Whitepapers & Research](docs/abstracts.md)
3. Market context: [Finance Reading List](docs/finance-reading.md)
4. Terminology: [Comprehensive Glossary](docs/glossary.md)

---

## Directory Structure

```
Smart-Contract-Resources/
│
├── README.md                           # Main landing page & index
├── ORGANIZATION.md                     # This file - navigation guide
│
├── docs/                              # Comprehensive documentation
│   ├── getting-started.md             # Core references & tooling (62 lines)
│   ├── ethereum-consensus.md          # PoS consensus & EVM deep dive (566 lines) [NEW]
│   ├── memory-storage-opcodes.md      # Memory, storage & opcodes deep dive [ENHANCED]
│   ├── transactions.md                # Transaction types & signatures (41 lines)
│   ├── security.md                    # Top 7 vulnerabilities + testing (425 lines) [EXPANDED]
│   ├── defi.md                        # DeFi protocols & trends (365 lines)
│   ├── tokens.md                      # EIP vs ERC + token standards [ENHANCED]
│   ├── finance-reading.md             # Books & market analysis (100 lines)
│   ├── deployment-wallets.md          # Deployment & wallet security (106 lines)
│   ├── career.md                      # Teams, jobs, learning paths (158 lines)
│   ├── abstracts.md                   # Whitepapers & research (100 lines)
│   ├── contract-layout.md             # Solidity best practices (342 lines)
│   └── glossary.md                    # 100+ terms with cross-refs (606 lines) [EXPANDED]
│
└── src/                               # Source code & examples
    ├── web3-exploits.md               # Exploit categorization checklist
    │
    ├── real-world-exploits/           # [NEW] Real exploit references
    │   └── README.md                  # 15+ major hacks with postmortems (520 lines)
    │
    ├── damn-vulnerable-defi-foundry/  # Practice challenges
    │   ├── unstoppable/               # Flash loan challenges
    │   ├── naive-receiver/
    │   ├── truster/
    │   ├── side-entrance/
    │   ├── the-rewarder/
    │   ├── selfie/                    # Governance attacks
    │   ├── climber/
    │   ├── compromised/               # Oracle manipulation
    │   ├── puppet/
    │   ├── puppet-v2/
    │   ├── puppet-v3/
    │   ├── free-rider/                # NFT & marketplace
    │   ├── shards/
    │   ├── backdoor/                  # Advanced DeFi
    │   ├── wallet-mining/
    │   ├── curvy-puppet/
    │   ├── abi-smuggling/
    │   └── withdrawal/
    │
    └── yul-contracts/                 # Yul/assembly examples
        ├── yul-02-types.sol
        ├── yul-03-basic-operations.sol
        ├── yul-04-storage-part-1.sol
        └── ...
```

---

## Key Features by Section

### 1. Ethereum Consensus & EVM (NEW)
**File**: `docs/ethereum-consensus.md` (566 lines)

Comprehensive guide based on Mastering Ethereum 2nd Edition:
- Proof-of-Stake consensus mechanics
- Validator operations & staking
- Client architecture (execution + consensus)
- EVM internals (stack, memory, storage, gas)
- Block production & finality
- Network layer & P2P protocols

**Quick Reference**:
- Slot: 12 seconds
- Epoch: 32 slots (~6.4 minutes)
- Finality: ~2 epochs (~13 minutes)
- Validator stake: 32 ETH minimum, 2048 ETH max
- Staking APR: ~5-8% (2026)

### 2. Security & Top Vulnerabilities (EXPANDED)
**File**: `docs/security.md` (425 lines)

Now includes ranked vulnerability categories:

**Top 7 Attack Types** (by historical losses):
1. **Price/Oracle Manipulation** ($500M+)
   - Flash loan attacks, stale data, precision errors, TWAP gaming
   
2. **Accounting/Share Inflation** (vault protocols)
   - First depositor attacks, share dilution, ERC-4626 vulnerabilities
   
3. **Reentrancy** (classic & read-only)
   - Cross-function, cross-contract, read-only, token hooks
   
4. **Access Control Failures** ($611M Poly Network)
   - Unprotected initialize, missing modifiers, role misconfig
   
5. **Account Abstraction (ERC-4337)** - NEW
   - UserOp validation, bundler attacks, entry point exploits
   
6. **L2/Rollup Security** - NEW
   - Sequencer failures, message passing, state root attacks
   
7. **Cross-Chain Bridges** ($625M Ronin) - NEW
   - Signature validation, merkle proofs, relayer attacks

### 3. Real-World Exploits (NEW)
**File**: `src/real-world-exploits/README.md` (520 lines)

Documented exploits with available contracts & postmortems:

**2024**:
- Orbit Bridge ($82M) - Private key compromise
- Radiant Capital ($50M) - Social engineering + multisig
- Shezmu ($4.9M) - Unprotected initialize

**2023**:
- Euler Finance ($197M) - Donation attack + reentrancy
- Mango Markets ($110M) - Oracle manipulation
- Nomad Bridge ($190M) - Merkle root validation bug

**2022**:
- Ronin Bridge ($625M) - 5/9 validator keys compromised
- Wormhole ($326M) - Signature verification bypass
- Poly Network ($611M) - Missing access control

**Historical**:
- The DAO ($60M, 2016) - Classic reentrancy (ETH/ETC split)
- Yearn Finance ($11M, 2021) - Flash loan price manipulation
- Cream Finance ($130M, 2021) - ERC-777 reentrancy

Each includes:
- Vulnerability explanation with code examples
- Official postmortem links
- Rekt News articles
- Root cause analysis
- Mitigation strategies
- Key learnings

### 4. Enhanced Glossary (EXPANDED)
**File**: `docs/glossary.md` (606 lines)

Added technical definitions:
- **Ethereum PoS concepts**: attestations, checkpoints, LMD GHOST, slots/epochs
- **DeFi precision math**: ray (27 decimals), wad (18 decimals)
- **Consensus mechanics**: Block structure, validator duties
- Cross-references to detailed guides

---

## Finding Information

### By Topic

| Topic | Primary Resource | Supporting Resources |
|-------|------------------|---------------------|
| **Consensus/PoS** | [Ethereum Consensus](docs/ethereum-consensus.md) | [Glossary: Slots/Epochs](docs/glossary.md) |
| **EVM Internals** | [Memory, Storage & Opcodes](docs/memory-storage-opcodes.md) | [Ethereum Consensus](docs/ethereum-consensus.md) |
| **Security Auditing** | [Security Guide](docs/security.md) | [Real Exploits](src/real-world-exploits/), [DVDeFi](src/damn-vulnerable-defi-foundry/) |
| **DeFi Development** | [DeFi Guide](docs/defi.md) | [Tokens](docs/tokens.md), [Security](docs/security.md) |
| **Gas Optimization** | [Memory, Storage & Opcodes](docs/memory-storage-opcodes.md) | [EVM Architecture](docs/ethereum-consensus.md) |
| **Career/Learning** | [Career Guide](docs/career.md) | [Getting Started](docs/getting-started.md) |

### By Vulnerability Type

| Vulnerability | Security Guide Section | Real-World Example |
|--------------|------------------------|-------------------|
| Oracle Manipulation | [Price/Oracle §1](docs/security.md#1-priceoracle-manipulation-) | [Mango Markets](src/real-world-exploits/README.md#mango-markets-110m---october-2022) |
| Share Inflation | [Accounting §2](docs/security.md#2-accountingshare-inflation-attacks-) | [Sentiment Protocol](src/real-world-exploits/README.md#b-share-dilution) |
| Reentrancy | [Reentrancy §3](docs/security.md#3-reentrancy-classic--read-only-) | [The DAO](src/real-world-exploits/README.md#the-dao-60m---june-2016) |
| Access Control | [Access Control §4](docs/security.md#4-access-control-failures-) | [Poly Network](src/real-world-exploits/README.md#poly-network-611m---august-2021) |
| Bridge Exploits | [Cross-Chain §7](docs/security.md#7-cross-chain-bridge-vulnerabilities-) | [Ronin](src/real-world-exploits/README.md#ronin-bridge-625m---march-2022) |

### By Learning Stage

**Beginner** → Intermediate → Advanced → Expert

```
Getting Started
    ↓
Contract Layout + Glossary
    ↓
Security Basics + DVDeFi Challenges
    ↓
Gas Optimization + DeFi Patterns
    ↓
Real-World Exploits + Advanced Security
    ↓
Ethereum Consensus Deep Dive + Research Papers
```

---

## Recommended Learning Paths

### Path 1: Security Auditor
1. **Week 1-2**: [Getting Started](docs/getting-started.md) + [Security Basics](docs/security.md)
2. **Week 3-4**: [Real-World Exploits](src/real-world-exploits/) study + analysis
3. **Week 5-6**: [Damn Vulnerable DeFi](src/damn-vulnerable-defi-foundry/) - solve all challenges
4. **Week 7-8**: [DeFi Guide](docs/defi.md) - protocol mechanics
5. **Week 9+**: Participate in [Code4rena](docs/security.md#bug-bounty-platforms) contests

### Path 2: Smart Contract Developer
1. **Week 1**: [Getting Started](docs/getting-started.md) + [Contract Layout](docs/contract-layout.md)
2. **Week 2**: [Ethereum Consensus](docs/ethereum-consensus.md) - EVM section
3. **Week 3**: [Memory, Storage & Opcodes](docs/memory-storage-opcodes.md) + practice
4. **Week 4**: [Token Standards](docs/tokens.md) - implement ERC-20/721
5. **Week 5**: [DeFi Guide](docs/defi.md) - understand protocols
6. **Week 6+**: Build projects, study [Security](docs/security.md)

### Path 3: Protocol Researcher
1. **Phase 1**: [Ethereum Consensus](docs/ethereum-consensus.md) - complete understanding
2. **Phase 2**: [Whitepapers](docs/abstracts.md) - foundational papers
3. **Phase 3**: [DeFi Guide](docs/defi.md) - protocol mechanics & economics
4. **Phase 4**: [Finance Reading](docs/finance-reading.md) - TradFi parallels
5. **Phase 5**: [Real Exploits](src/real-world-exploits/) - security research
6. **Phase 6+**: Original research, publish findings

---

## Cross-References

### Internal Links
- Security Guide → Real-World Exploits → DVDeFi Challenges (complete learning cycle)
- Glossary ↔ All Guides (bidirectional cross-references)
- Ethereum Consensus ↔ Gas Optimization (EVM mechanics)
- DeFi Guide ↔ Security Guide (protocol-specific vulnerabilities)

### External Resources
- [Mastering Ethereum 2nd Ed](https://masteringethereum.xyz/) - Consensus guide source
- [Rekt News](https://rekt.news/) - Exploit documentation source
- [Code4rena](https://code4rena.com/) - Live audit contests
- [DeFiLlama](https://defillama.com/hacks) - Exploit database

---

## Documentation Standards

All documentation follows these standards:
- **Last verified date** at top of each file
- **Cross-references** to related content
- **Real-world examples** with sources
- **Code samples** where applicable
- **Clear navigation** (back to main, next section)

---

## Recent Additions (2026-01)

### New Content
1. **[Ethereum Consensus & EVM Guide](docs/ethereum-consensus.md)** - 566 lines
   - Complete PoS consensus explanation
   - Validator operations & staking guide
   - EVM architecture deep dive
   - Based on Mastering Ethereum 2nd Edition

2. **[Real-World Exploits Collection](src/real-world-exploits/)** - 520 lines
   - 15+ major exploits with postmortems
   - Vulnerable code examples
   - Official postmortem links
   - Lessons learned & mitigations

3. **[Top 7 Ranked Vulnerabilities](docs/security.md#top-vulnerability-categories-ranked-by-impact)**
   - Account Abstraction (ERC-4337)
   - L2/Rollup Security
   - Cross-Chain Bridge vulnerabilities

### Enhanced Content
- **Glossary**: Added PoS terms (attestations, checkpoints, LMD GHOST, ray/wad)
- **Security Guide**: Expanded from 199 to 425 lines
- **Cross-references**: Linked related concepts across all documents

---

## Tips for Using This Repository

### For Quick Reference
- Use [Glossary](docs/glossary.md) to look up unfamiliar terms
- Check [Security Guide](docs/security.md) for vulnerability quick reference
- Bookmark specific sections (all have anchor links)

### For Deep Learning
- Follow recommended learning paths above
- Complete DVDeFi challenges alongside reading
- Study real exploits after understanding basics
- Cross-reference glossary while reading technical docs

### For Auditing Work
- Keep [Top 7 Vulnerabilities](docs/security.md#top-vulnerability-categories-ranked-by-impact) checklist handy
- Reference [Real-World Exploits](src/real-world-exploits/) for patterns
- Use [Web3 Exploits](src/web3-exploits.md) as audit checklist

### For Development
- Follow [Contract Layout Guide](docs/contract-layout.md) for structure
- Apply [Memory, Storage & Opcodes](docs/memory-storage-opcodes.md) patterns
- Reference [Token Standards](docs/tokens.md) for implementations
- Study [DeFi Guide](docs/defi.md) for protocol patterns

---

## Repository Metrics

### Documentation Coverage
- **Consensus Mechanisms**: Comprehensive (566 lines)
- **Security**: Comprehensive (425 lines + 520 exploit analysis)
- **DeFi**: Comprehensive (365 lines)
- **Gas Optimization**: Detailed (163 lines)
- **Glossary**: Extensive (606 lines, 100+ terms)
- **Career Resources**: Complete (158 lines)

### Practical Resources
- **Practice Challenges**: 20+ contracts (DVDeFi)
- **Real Exploits**: 15+ with postmortems
- **Tools Listed**: 30+ development & security tools
- **External Links**: 200+ curated resources

---

[← Back to Main](README.md)
