# Solidity Contract Layout

**Last verified: 2026-01**

---

## Recommended Contract Structure

Following a consistent contract layout improves readability, maintainability, and makes auditing easier.

### Complete Layout Template

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions
```

---

## Detailed Breakdown

### 1. Version & License

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
```

- Always include SPDX license identifier
- Use specific Solidity version or version range
- Consider using latest stable version for new projects

---

### 2. Imports

```solidity
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {IMyInterface} from "./interfaces/IMyInterface.sol";
```

**Best practices:**
- Use named imports for clarity: `{ERC20}` instead of `*`
- Group by category (external libraries, interfaces, local files)
- Use relative paths for local imports

---

### 3. Errors

```solidity
error MyContract__InsufficientBalance();
error MyContract__InvalidAddress();
error MyContract__Unauthorized();
```

**Naming convention:**
- `ContractName__ErrorDescription` format
- More gas efficient than require strings
- Self-documenting code

---

### 4. Interfaces, Libraries, Contracts

```solidity
interface IMyInterface {
    function myFunction() external;
}

library MyLibrary {
    function myHelper() internal pure returns (uint256) {}
}

contract MyContract is ERC20, Ownable {
    // Contract code
}
```

**Order:**
1. Interfaces
2. Libraries
3. Contracts (with inheritance)

---

### 5. Type Declarations

```solidity
using MyLibrary for uint256;

enum Status {
    Pending,
    Active,
    Completed
}

struct User {
    address wallet;
    uint256 balance;
    Status status;
}
```

**Include:**
- `using` statements
- Enums
- Structs

---

### 6. State Variables

```solidity
// Constants (ALL_CAPS)
uint256 public constant MAX_SUPPLY = 1_000_000;
bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

// Immutables (i_variableName)
address public immutable i_owner;
uint256 public immutable i_deploymentTime;

// Storage variables (s_variableName for testing/clarity)
mapping(address => uint256) private s_balances;
address[] private s_users;
uint256 private s_totalValue;
```

**Naming conventions:**
- `ALL_CAPS` for constants
- `i_variableName` for immutable
- `s_variableName` for storage (optional, helpful for testing)

**Visibility order:**
1. Public constants
2. Public immutables
3. Public storage variables
4. Internal variables
5. Private variables

---

### 7. Events

```solidity
event Transfer(address indexed from, address indexed to, uint256 amount);
event Deposit(address indexed user, uint256 amount);
event Withdrawal(address indexed user, uint256 amount);
```

**Best practices:**
- Use `indexed` for filterable parameters (max 3)
- Past tense naming (some use present: "Transfer" vs "Transferred")
- Document in NatSpec comments

---

### 8. Modifiers

```solidity
modifier onlyOwner() {
    if (msg.sender != i_owner) revert MyContract__Unauthorized();
    _;
}

modifier validAddress(address _addr) {
    if (_addr == address(0)) revert MyContract__InvalidAddress();
    _;
}
```

**Order:**
- Most general modifiers first
- Most specific modifiers last

---

### 9. Functions

#### Constructor

```solidity
constructor(address _initialOwner) {
    i_owner = _initialOwner;
    i_deploymentTime = block.timestamp;
}
```

#### Special Functions

```solidity
receive() external payable {
    // Handle plain ETH transfers
}

fallback() external payable {
    // Handle unknown function calls or ETH with data
}
```

#### External Functions

```solidity
/// @notice Deposits tokens into the contract
/// @param amount The amount of tokens to deposit
function deposit(uint256 amount) external {
    // Implementation
}
```

#### Public Functions

```solidity
function getBalance(address user) public view returns (uint256) {
    return s_balances[user];
}
```

#### Internal Functions

```solidity
function _updateBalance(address user, uint256 amount) internal {
    s_balances[user] = amount;
}
```

**Naming:** Prefix with underscore `_functionName`

#### Private Functions

```solidity
function _internalCalculation(uint256 value) private pure returns (uint256) {
    return value * 2;
}
```

**Naming:** Prefix with underscore `_functionName`

#### View & Pure Functions

```solidity
// Internal & private view/pure
function _calculateFee(uint256 amount) internal pure returns (uint256) {
    return amount / 100;
}

// External & public view/pure (at the end)
function getTotalSupply() external view returns (uint256) {
    return totalSupply;
}
```

---

## NatSpec Documentation

Use NatSpec comments for all public/external functions:

```solidity
/// @title My Contract
/// @author Your Name
/// @notice Brief description of what this contract does
/// @dev Additional details for developers
contract MyContract {
    /// @notice Deposits tokens into the contract
    /// @dev Uses SafeERC20 for safe transfers
    /// @param amount The amount of tokens to deposit
    /// @return success Whether the deposit was successful
    function deposit(uint256 amount) external returns (bool success) {
        // Implementation
    }
}
```

**NatSpec tags:**
- `@title` - Contract title
- `@author` - Author name
- `@notice` - User-facing description
- `@dev` - Developer notes
- `@param` - Parameter description
- `@return` - Return value description

---

## Additional Best Practices

### Checks-Effects-Interactions Pattern

```solidity
function withdraw(uint256 amount) external {
    // Checks
    if (s_balances[msg.sender] < amount) revert InsufficientBalance();
    
    // Effects
    s_balances[msg.sender] -= amount;
    
    // Interactions
    (bool success, ) = msg.sender.call{value: amount}("");
    if (!success) revert TransferFailed();
}
```

### Gas Optimization

- Group similar-sized variables in storage slots
- Use appropriate data types (uint8 vs uint256)
- Mark functions as `external` when not called internally
- Use `calldata` instead of `memory` for read-only parameters

---

## References

- [Solidity Style Guide](https://docs.soliditylang.org/en/latest/style-guide.html)
- [Cyfrin Foundry Course - Contract Layout](https://github.com/Cyfrin/foundry-full-course-f23#solidity-contract-layout)

---

[← Back to Main](../README.md) | [Next: Glossary →](glossary.md)
