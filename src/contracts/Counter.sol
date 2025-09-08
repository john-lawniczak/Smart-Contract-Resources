//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    // Contract code here
    uint public count; //unsigned integer, must be positive

    constructor() public { //constructor runs onc
        count = 0;
    }

    function incrementCount() public { //write function
        count = count++;
    }
}