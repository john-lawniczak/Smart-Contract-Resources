//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {

    uint[] public uintArray = [4,5,6];
    string[] public stingArray = ["apple", "banana", "orange"];
    string[] public value;
    uint[][] public array2D = [[4,5,6], [7,8,9]];

    function addValue(string memory _value) public {
        value.push(_value);

    }

    function valueCount() public view returns(uint) {
        return value.length;
    }

}