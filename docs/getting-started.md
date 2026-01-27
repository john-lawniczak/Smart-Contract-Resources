# Getting Started with Smart Contract Development

**Last verified: 2026-01**

---

## Core References

### Essential Documentation
- [Mastering Ethereum (2nd Edition)](https://masteringethereum.xyz/) - comprehensive Ethereum guide
- Solidity [documentation](https://docs.soliditylang.org/en/latest/) and [cheatsheet](https://docs.soliditylang.org/en/latest/cheatsheet.html) - official language docs
- [Ethereum developer docs](https://ethereum.org/en/developers/docs/) - network and protocol specs
- [OpenZeppelin Contracts docs](https://docs.openzeppelin.com/contracts/) - secure contract implementations
- [Solidity by Example](https://solidity-by-example.org/) - hands-on code examples

### Learning Resources
- [RareSkills GitHub](https://github.com/RareSkills) - advanced security and gas optimization content
- [RareSkills 140 Ethereum Developer Interview Questions](https://www.rareskills.io/post/solidity-interview-questions) - comprehensive interview prep

### News & Incident Tracking
- [Blockthreat Intelligence](https://newsletter.blockthreat.io/) - weekly security updates
- [Rekt](https://rekt.news/) - DeFi hack post-mortems and analysis
- [DeFiLlama Hacks Database](https://defillama.com/hacks) - comprehensive hack tracker with TVL
- [Web3 is Going Great](https://web3isgoinggreat.com/) - critical timeline of crypto incidents

### Opinion & Analysis
- [Matt Levine](https://www.bloomberg.com/opinion/authors/ARbTQlRLRjE/matthew-s-levine) (Bloomberg Opinion) - finance and markets columnist, [recommended by Dan Robinson](https://youtu.be/Lz7g0ny99jk?t=3183)

### Podcasts
- [Bankless](http://podcast.banklesshq.com/) - Ethereum and DeFi news and interviews
- [Unchained](https://unchainedcrypto.com/podcasts/) - crypto news and deep dives with Laura Shin
- [Scraping Bits](https://rss.com/podcasts/scrapingbits/) - technical security and development discussions

---

## Tooling

### Development Environments
- [Remix](https://remix.ethereum.org/) - browser-based IDE for quick prototyping
- [Foundry](https://book.getfoundry.sh/) - fast Solidity testing framework. See also: [Awesome Foundry](https://github.com/crisgarner/awesome-foundry), [Cheat Codes](https://book.getfoundry.sh/cheatcodes/)
- [Hardhat](https://hardhat.org/hardhat-runner/docs/getting-started#overview) - Ethereum development environment. Features: [forking mainnet](https://hardhat.org/hardhat-network/docs/guides/forking-other-networks), console.log via `import "hardhat/console.sol"`

### Static Analysis & Security
- [Slither](https://github.com/crytic/slither) - static analyzer with MCP (Model Context Protocol) support for AI assistants

### Fuzzing & Dynamic Analysis
- [Echidna](https://github.com/crytic/echidna) - property-based fuzzer (Haskell-based). See: [fuzzing guide](https://bushido-sec.com/index.php/2023/07/27/fuzzing-smart-contracts/)
- [Medusa](https://github.com/crytic/medusa) - coverage-guided fuzzer (Go-based, faster than Echidna with parallel workers)
- [Mythril](https://github.com/ConsenSys/mythril) - symbolic execution, SMT solving, and taint analysis. See also: [MythX](https://github.com/muellerberndt/awesome-mythx-smart-contract-security-tools)

### Libraries & SDKs
- [Ethers.js](https://docs.ethers.org/v5/single-page/) - Ethereum library and wallet implementation
- [Web3.js](https://web3js.org/#/) - Ethereum JavaScript API
- [Wagmi](https://wagmi.sh/) - React hooks for Ethereum

### Development Tools
- [Inline bookmarks](https://marketplace.visualstudio.com/items?itemName=tintinweb.vscode-inline-bookmarks) - VSCode extension for audit notes (e.g., `// @audit`)

---

[← Back to Main](../README.md) | [Next: Memory, Storage & Opcodes →](memory-storage-opcodes.md)
