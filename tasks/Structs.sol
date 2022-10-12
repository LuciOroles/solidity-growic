// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/**
Create a smart contract that saves user balance. The contract should have the functions:

deposit (uint256 amount) this function accepts one argument and it saves the amount a user is depositing into a mapping,
checkBalance() this function searches for the user balance inside the balance mapping and returns the balance of whoever is calling the contract.

setUserDetails(string calldata name, uint256 age) this function accepts 2 arguments that represent the details of the user calling the smart contract and it saves them into a defined struct,
getUserDetail() this function retrieves and returns the details saved for the user calling the contract.
*/

struct UserData {
    string name;
    uint256 age;
}

contract StructTask {

    address public owner;

    mapping(address => uint256) private amounts;
    mapping(address => UserData) private usersData;

    constructor() {
        owner = msg.sender;
    }

    function deposit(uint256 _amount) public {
        amounts[msg.sender] = _amount;
    }

    function checkBalance() public view returns (uint256) {
        return amounts[msg.sender];
    }

    function setUserDetails(string calldata name, uint256 age) public {
        usersData[msg.sender] = UserData({ name: name, age: age });
    }

    function getUserDetail() public view returns(string memory, uint256) {
        
        UserData storage userData = usersData[msg.sender];
        return (userData.name, userData.age);
    }

}
