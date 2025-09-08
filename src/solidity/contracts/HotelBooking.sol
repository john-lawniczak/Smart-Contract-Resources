// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Showcase payment transfers, enums, function modifiers & events

contract HotelRoom {
    // enum data structure, state options blockchain coorelates to index position
    enum Statuses {Vacant,Occupied}
    Statuses public currentStatus;

    event Occupy(address _occupant, uint256 _value);

    // allows address to recieve eth funds
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant() {
        // check status
        // require function checks boolean: require(false); and if false rest of code will run
        // require(currentSatus = Statuses.Vacant, "Currently occupied.")
        require(currentStatus == Statuses.Vacant, "Currently occupied.");
        _;
    }

    modifier costs(uint256 _amount) {
        // check price
        require(msg.value >= _amount, "Not enough Ether provided.");
        _;
    }

    function book() public payable onlyWhileVacant costs(2 ether) {
        currentStatus = Statuses.Occupied;
        // uses call instead of transfer
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent);

        // calls Occupy event; log of bookings 
        emit Occupy(msg.sender, msg.value);
    }
}