// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Storage {
    uint256 private a;
    uint256 private b;
    uint256 private c;

    function storageLocationA() external pure returns (uint256) {
        uint256 slotLocationA;

        assembly {
            slotLocationA := a.slot
        }
        return slotLocationA;
    }

    function storageLocationB() external pure returns (uint256) {
        uint256 slotLocationB;

        assembly {
            slotLocationB := b.slot
        }
        return slotLocationB;
    }
     function storageLocationC() external pure returns (uint256) {
        uint256 slotLocationC;

        assembly {
            slotLocationC := c.slot
        }
        return slotLocationC;
    }
}