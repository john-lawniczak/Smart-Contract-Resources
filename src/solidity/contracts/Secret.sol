// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Showcase contract inheritance

contract Ownable {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    // only the owner can call the function
    modifier onlyOwner() {
        require(msg.sender == owner, "must be owner");
        _;
    }
}

contract SecretVault {
    // state variable
    string secret;

    // _secret is local variable
    constructor(string memory _secret) {
        secret = _secret;
        // super; is a keyword that calls from parent 
    }

    function getSecret() public view returns (string memory) {
        return secret;
    }
}

// inherits from Ownable contract
// create a new contract when contract is deployed and saves address
contract Secret is Ownable {
    address secretVault;

    constructor(string memory _secret) {
        // static type declare type then local variable then new contract passing in variable
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        // call another smart contract inside a smart contract: name of smart contract/address/call function on it
        return SecretVault(secretVault).getSecret();
    }
}