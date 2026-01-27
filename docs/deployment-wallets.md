# Contract Deployment & Wallets

**Last verified: 2026-01**

---

## Contract Deployment

### Foundry Deployment Commands

- `forge build --vv` - verbose compiling
- `forge build --via-ir --vv` - IR-based compilation for advanced optimizations

### Configuration

Set in `foundry.toml`:
```toml
[profile.default]
via_ir = true
optimizer_runs = 200
```

---

## Wallets

### Browser & Mobile Wallets

- **[Rabby](https://rabby.io/)** - multi-chain wallet with DeFi-focused UI, built-in security checks, and transaction pre-execution simulation

- **[MetaMask](https://metamask.io/)** - most popular Ethereum wallet, browser extension and mobile app

- **[Phantom](https://phantom.com/)** - self-custodial wallet for Solana and EVM chains, NFT gallery, swap functionality, scam detection

- **[Rainbow](https://rainbow.me/)** - Ethereum wallet with beautiful UX, built-in swaps, ENS support, NFT showcase

- **[Frame](https://frame.sh/)** - native desktop wallet with hardware wallet integration, privacy-focused

- **[Coinbase Wallet](https://www.coinbase.com/wallet)** - self-custodial wallet with dApp browser, supports multiple chains

- **[Zerion](https://zerion.io/)** - wallet and portfolio tracker with DeFi protocol integrations

---

### Hardware Wallets

- **[Ledger](https://www.ledger.com/)** - industry-standard hardware wallet (Nano S Plus, Nano X, Stax)

- **[Trezor](https://trezor.io/)** - open-source hardware wallet with strong security reputation

- **[Tangem](https://tangem.com/)** - card-style NFC hardware wallet (battery-free), supports 14,000+ assets across 85+ chains

- **[SafePal S1](https://www.safepal.com/safepal-s1)** - fully offline cold wallet (no USB/WiFi/Bluetooth), affordable

- **[GridPlus Lattice1](https://gridplus.io/)** - always-online hardware wallet with large touchscreen

---

### Smart Contract Wallets

- **[Safe](https://safe.global/)** (formerly Gnosis Safe) - multi-sig smart contract wallet for teams and DAOs

- **[Argent](https://www.argent.xyz/)** - smart contract wallet with social recovery, guardian system

- **[Loopring Wallet](https://wallet.loopring.io/)** - zkRollup L2 wallet with low fees and built-in DEX

---

### Bitcoin-Focused

- **[Bitkey](https://bitkey.world/)** - multisig self-custody by Block, Inc. (mobile + hardware + recovery)

- **[Sparrow](https://sparrowwallet.com/)** - Bitcoin-only desktop wallet for advanced users, hardware wallet integration

---

## Wallet Security Best Practices

### General Guidelines

1. **Never share your seed phrase** - anyone with your seed phrase has full access to your funds
2. **Use hardware wallets for large amounts** - cold storage is the safest option
3. **Verify contract interactions** - always check what you're signing
4. **Separate wallets for different purposes**:
   - Hot wallet: small amounts for daily DeFi interactions
   - Warm wallet: medium amounts for regular use
   - Cold wallet: large amounts for long-term storage

### Transaction Safety

- **Check the recipient address** - malware can swap addresses in clipboard
- **Simulate transactions** - use tools like Tenderly or Rabby's simulation
- **Review token approvals** - use [Revoke.cash](https://revoke.cash/) to manage approvals
- **Beware of unlimited approvals** - approve only what's needed

### Phishing Prevention

- **Bookmark official URLs** - don't trust search engine results
- **Verify Discord/Telegram admins** - scammers impersonate team members
- **No unsolicited DMs** - legitimate projects won't DM first
- **Check contract addresses** - verify on multiple sources (website, Etherscan, CoinGecko)

---

[← Back to Main](../README.md) | [Next: Career Resources →](career.md)
