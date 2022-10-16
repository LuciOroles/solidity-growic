// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/**
We will allow users to send real ETH deposits to our smart contract by adding a payable function. 
Function deposit will be re-written to accept no arguments but receive real ETH deposits 
and still save and update user balance.

deposit() accepts ETH through the payable modifier and updates user balance accordingly
*/
contract PayableTask {
    address public owner;

    mapping(address => uint256) private amounts;

    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable {
        amounts[msg.sender] = amounts[msg.sender] + msg.value;
    }

    function checkBalance() public view returns (uint256) {
        return amounts[msg.sender];
    }
}
