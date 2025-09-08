//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // mapping associates key value pairs; so uint number below associates with that particular string
    mapping(uint => string) public names;
    mapping(uint => Book) public books;
    mapping(address => mapping(uint => Book)) public myBooks;

    struct Book {
        string title;
        string author;
        string genre;

    }

    constructor() {
        names[1] = "John";
        names[2] = "Paul";
    }

    function addBook(
        uint256 _id, 
        string memory _title, 
        string memory _author, 
        string memory _genre
    ) public {
        books[_id] = Book(_title, _author, _genre);
    }
      
    function addMyBook(
        uint256 _id, 
        string memory _title, 
        string memory _author, 
        string memory _genre
    ) public {
        myBooks[msg.sender][_id] = Book(_title, _author, _genre);
    }

}
