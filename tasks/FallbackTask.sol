// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract FallbackTask {
 
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

    function withdraw(uint256 _amount) public {
        require(amounts[msg.sender] > _amount, "no buget");
        (bool succes, ) = (msg.sender).call{value: _amount}("");
        require(succes, "error on transfer");
        amounts[msg.sender] = amounts[msg.sender] - _amount;
    }

    fallback(bytes calldata _input) external payable returns (bytes memory) {
        amounts[msg.sender] = amounts[msg.sender] + msg.value;
        return _input;
    }

    receive() external payable {
        amounts[msg.sender] = amounts[msg.sender] + msg.value;
    }
}
