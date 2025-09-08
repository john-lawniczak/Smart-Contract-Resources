// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import 'forge-std/Test.sol';
import './../src/Scratchpad.sol';
import './../src/Token.sol';
import './../src/NFT.sol';

contract ScratchPad is Test {
    uint256 constant SIZE = 10;

    address owner = address(this);
    address user = vm.addr(0x1);

    function setUp() external {
        token = new Token();
        nft = new NFT();
        scratchpad = new ScratchPad();
    }

    function test_scratchpadCurrent() external {
        scratchpad.current();
    }

    function test_scratchpadOptimized() external {
        scratchpad.optimized();
    }
}