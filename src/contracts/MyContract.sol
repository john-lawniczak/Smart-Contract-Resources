//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // State Variable
    int256 public myInt = 1;
    uint public myUint = 1;
    uint256 public myUint256 = 1;
    uint8 public myUint8 = 1;

    string public myString = "hello world!";
    bytes32 public myBytes32 = "Hello world!";

    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    struct MyStruct {
        uint256 myUint256;
        string myString;

    }

    MyStruct public myStruct = MyStruct(1, "Hello world!");

    //Local Variable
    function getValue () public pure returns (uint) {
        uint value = 1;
        return value;
    }

}