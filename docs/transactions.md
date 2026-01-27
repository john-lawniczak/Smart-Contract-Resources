# Transactions and Signatures

**Last verified: 2026-01**

---

## Transaction Types (EIP-2718 Typed Transaction Envelope)

Per *[Mastering Ethereum (2nd Edition)](https://masteringethereum.xyz/)*, Ethereum supports multiple transaction formats, each identified by a type prefix:

| Type | Name | EIP | Introduced | Description |
|------|------|-----|------------|-------------|
| **Type 0** | Legacy | Pre-EIP-2718 | Genesis | Original transaction format. No type prefix. Uses `gasPrice`. |
| **Type 1** (0x01) | Access List | [EIP-2930](https://eips.ethereum.org/EIPS/eip-2930) | Berlin (Apr 2021) | Adds `accessList` to pre-declare storage slots and addresses accessed. Reduces gas for cross-contract calls. |
| **Type 2** (0x02) | Dynamic Fee (EIP-1559) | [EIP-1559](https://eips.ethereum.org/EIPS/eip-1559) | London (Aug 2021) | Replaces `gasPrice` with `maxFeePerGas` and `maxPriorityFeePerGas`. Burns base fee, tips validators. |
| **Type 3** (0x03) | Blob Transaction | [EIP-4844](https://eips.ethereum.org/EIPS/eip-4844) | Dencun (Mar 2024) | Carries blob data for L2 rollups. Uses separate blob fee market. Max 6 blobs per block (Pectra). |
| **Type 4** (0x04) | Set Code (EOA Delegation) | [EIP-7702](https://eips.ethereum.org/EIPS/eip-7702) | Pectra (May 2025) | Allows EOAs to temporarily set account code for one transaction, enabling account abstraction features. |

### Key Points

- Type 2 (EIP-1559) is the most common transaction type as of 2026
- Type 3 (blob transactions) are primarily used by L2 rollups for data posting
- Type 4 enables EOAs to act like smart contracts temporarily without changing addresses
- Legacy (Type 0) transactions still work but are less gas-efficient

---

## ECDSA Signature Components (V, R, S)

All Ethereum transactions use ECDSA (Elliptic Curve Digital Signature Algorithm) signatures with three components:

- **R (32 bytes)**: The x-coordinate of the random point selected during the signing process
- **S (32 bytes)**: A deterministic value ensuring signature uniqueness and validity  
- **V (1 byte)**: The recovery ID used to identify the correct public key for signature verification. Also includes the chain ID to protect against replay attacks ([EIP-155](https://eips.ethereum.org/EIPS/eip-155))

These components allow the network to verify the transaction was signed by the sender's private key and cryptographically recover the sender's Ethereum address for validation.

---

[← Back to Main](../README.md) | [Next: DeFi →](defi.md)
