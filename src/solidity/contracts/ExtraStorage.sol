// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

// Inherits all functionality of SimpleStorage as child
contract ExtraStorage is SimpleStorage {
    // overiding functions
    // virtual and override
    function store(uint256 _favNum) public override {
        favNum = _favNum + 5;
    }
    
}