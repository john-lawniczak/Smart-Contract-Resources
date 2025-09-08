// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleGas {
    uint256 private x = 10;

    function light() external view returns (uint256) {
        return x + 1;
    }

    function heavy () external view returns (uint256) {
        bytes32 _x = keccak256(abi.encodePacked(x));
        for (uint256 i; i < 50; i++) {
            _x = keccak256(abi.encodePacked(x));
        }
        return uint256 (_x);
    }
   
    }
