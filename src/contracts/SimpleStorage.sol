// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    uint256 public favNum;
    People public person = People({favNum: 22, name: "Alex"});

    mapping(string => uint256) public nameToFavNum;

    struct People {
        uint favNum;
        string name;
    }

    // empty dynamic array
    People[] public people;

    // virtual key word allows for overriding
    function store(uint256 _favNum) public virtual {
        favNum = _favNum;
    }

    function retrieve() public view returns(uint256){
        return favNum;
    }

    // pushes/appends a person to the sarray
    function AddPerson(string memory _name, uint256 _favNum) public {
        // People memory newPerson = People({favNum: _favNum, name: _name});
        // People memory newPerson = People(_favNum, _name);
        people.push(People(_favNum, _name));
        nameToFavNum[_name] = _favNum;
    }
}
