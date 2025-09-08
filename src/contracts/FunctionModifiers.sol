// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

// Start of contract named "Demo".
contract Demo {
    // Declare public state variable 'owner' of type 'address'.
    // Public state variables automatically generate getter functions.
    address public owner;

    // Declare public state variable 'data' of type 'uint256' (unsigned integer of 256 bits).
    uint256 public data;

    // Declare a custom error named 'Unauthorized'.
    // This will be used to revert transactions when a non-owner calls a function they should not have access to.
    error Demo__Unauthorized();
    error Demo__NotEoughMoney();

    // The constructor function is called once when the contract is deployed.
    // It sets the contract deployer as the owner of the contract.
    constructor() {
        owner = msg.sender; 
    }

    // Function modifier 'onlyOwner' restricts the execution of certain functions to the owner of the contract only.
    // If 'msg.sender' (the caller of the function) is not the owner, it reverts the transaction with the custom error 'Unauthorized'.
    modifier onlyOwner {
        if (msg.sender != owner) revert Demo__Unauthorized();
        _;
    }

    // 'setData' function allows the owner to change the value of the 'data' state variable.
    // It uses the 'onlyOwner' modifier, thus only the owner of the contract can call this function.
    function setData(uint256 _data) public onlyOwner {
        data = _data;
    }

    // 'getDataExternal' function allows anyone to get the value of the 'data' state variable by calling this function externally.
    // It's marked 'external', so it can only be called from outside the contract.
    function getDataExternal() external view returns (uint256) {
        return data;
    }

    // 'getDataPublic' function is the same as 'getDataExternal', but it's marked 'public'.
    // This means it can be called both from outside the contract and from other functions inside this contract.
    function getDataPublic() public view returns (uint256) {
        return data;
    }

    // 'sum' function takes two unsigned integers as input, calculates their sum, and returns it.
    // It doesn't read or modify state variables, so it's marked 'pure'.
    function sum(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // 'deposit' function allows anyone to send Ether to the contract.
    // It's marked 'payable', so it can receive Ether. If the transaction value is zero, it reverts the transaction.
    function deposit() public payable {
        if (msg.value <= 0) revert Demo__NotEoughMoney();
    }

    // 'withdraw' function allows the owner to withdraw all Ether from the contract.
    // It uses the 'onlyOwner' modifier, thus only the owner of the contract can call this function.
    // The 'payable' keyword is used on the 'owner' to send the Ether, and 'transfer' is used to perform the send operation.
    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}
