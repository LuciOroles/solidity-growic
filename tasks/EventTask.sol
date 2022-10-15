// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

/**
 The contact should emit the following events when a user deposits and updates their profile information respectively:

    FundsDeposited(address user, uin256 amount)
    ProfileUpdated(address user)
*/

struct UserData {
    string name;
    uint256 age;
}

error AmountToSmall(
    uint256 amount
);



contract EventTask {

    address public owner;
    uint256 private Fee = 100;
    
    event FundsDeposited(
        address indexed user,
        uint256 amout
    );

    event ProfileUpdated(
        address indexed user_addres
    );


    mapping(address => uint256) private amounts;
    mapping(address => UserData) private usersData;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier haveDeposited() {
        require(amounts[msg.sender]!= 0, "Only depositer");
        _;
    }

    modifier minimumAccepted(uint256 value) {
        if (value < Fee) 
            revert AmountToSmall({
                amount: value
            });
        
        _;
    }
 
    function deposit(uint256 _amount) public {
        amounts[msg.sender] = _amount;
        emit FundsDeposited(msg.sender, _amount);
    }

    function withdraw( address  _address ) public onlyOwner {
        amounts[msg.sender] = amounts[msg.sender] + amounts[_address];
        amounts[_address] = 0;
    } 

    function addFound(uint256 _amount) public haveDeposited minimumAccepted(_amount) {
        amounts[msg.sender] = amounts[msg.sender] + _amount;
        emit FundsDeposited(msg.sender, _amount);
    }

    function checkBalance() public view returns (uint256) {
        return amounts[msg.sender];
    }

    function setUserDetails(string calldata name, uint256 age) public {
        usersData[msg.sender] = UserData({ name: name, age: age });
        emit ProfileUpdated(msg.sender);
    }

    function getUserDetail() public view returns(string memory, uint256) {
        
        UserData storage userData = usersData[msg.sender];
        return (userData.name, userData.age);
    }

}