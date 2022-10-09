// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/**
Create a smart contract that saves user balance. The contract should have the functions:

deposit (uint256 amount) this function accepts one argument and it saves the amount a user is depositing into a mapping,
checkBalance() this function searches for the user balance inside the balance mapping and returns the balance of whoever is calling the contract.
*/
contract MappingTask {

    address public owner;

    mapping(address => uint256) private amounts;

    constructor() {
        owner = msg.sender;
    }

    function deposit(uint256 _amount) public {
        amounts[msg.sender] = _amount;
    }

    function checkBalance(address _address) public view returns (uint256) {
        return amounts[_address];
    }

}