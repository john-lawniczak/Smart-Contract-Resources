// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC721 {
    function transfer(address, uint) external;

    function transferFrom(
        address,
        address,
        uint
    ) external;
}

contract Auction {
    event Start();
    event End(address highestBidder, uint highestBid);
    // indexed keyword parameter search an event for
    event Bid (address indexed sender, uint amount);
    event Withdraw(address indexed bidder, uint amount);


    // need to pay the seller the profits
    address payable public seller;
    // when contract starts and ends
    bool public started;
    bool public ended;
    uint public endAt;

    // defining NFT to auction with specific id
     IERC721 public nft;
     uint public nftId;

    uint public highestBid;
    address public highestBidder;
    // withdraw function allows for money returned if didn't win
    mapping(address => uint) public bids;

    constructor() {
        // seller is one who deployed contract
        seller = payable(msg.sender);
    }

    function start(IERC721 _nft, uint _nftId, uint startingBid) external {
        require(!started, "Already started.");
        require(msg.sender == seller, "Did not start the auction.");
         // have to bid higher than current bid
        highestBid = startingBid;

        nft = _nft;
        nftId = _nftId;
        nft.transferFrom(msg.sender, address(this), nftId);

        started = true;
        // block is transaction on block
        endAt = block.timestamp + 2 days;

        emit Start();
    }

    function bid() external payable {
        require(started, "Not started.");
        require(block.timestamp < endAt, "ended.");
        require(msg.value > highestBid);

        // if outbid user can withdraw funds to bid again
        if (highestBidder != address(0)) {
            bids[highestBidder] += highestBid;
        }

        highestBid = msg.value;
        highestBidder = msg.sender; 

        emit Bid(highestBidder, highestBid);

    }

    function withdraw() external payable {
        uint bal = bids[msg.sender];
        bids[msg.sender] = 0;
        (bool sent, bytes memory data) = payable(msg.sender).call{value: bal}("");
        require(sent, "Could not withdraw.");

        emit Withdraw(msg.sender, bal);
    }

    function end() external {
        require(started, "Start first.");
        require(block.timestamp >= endAt, "Auction ongoing.");
        require(!ended, "Auction ended.");

        if (highestBidder != address(0)) {
            nft.transfer(highestBidder, nftId);
            (bool sent, bytes memory data) = seller.call{value: highestBid}("");
        require(sent, "Could not pay seller.");
        } else {
            nft.transfer(seller, nftId);
        }
        ended = true;
        emit End(highestBidder, highestBid);
    }

}