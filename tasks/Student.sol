// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/**
    Task 1:
    Create a smart contract for registering the details of a student with their StudentID(Ethereum Address) and to get the details 
    based on their Student ID and they can be added only by the contract deployed address.
    Also, check whether the studentID data already exists. 
    Also, have a function to view the Details of student based on their studentID including percentage and Total Marks.
 */

contract StudentCtr {
    struct Student { 
        string name;
        string lastName;
    }

    address public owner;
    mapping(address => Student) public students;
    mapping(address => bool) public existing;


    constructor()  {
      owner = msg.sender;
   }

   function register(address _addres, string memory _name, string memory _lastName) public onlyOwner {
       require(existing[_addres] == false, "Already exists!");
       existing[_addres]  = true;
       students[_addres] = Student(_name, _lastName);
   }

   function getStudentDetails(address  _addr) public view  returns (string memory first, string memory last) {
       require(existing[_addr] == true, "No such studdent exists!");
        Student memory _std = students[_addr];
               
        return (_std.name, _std.lastName);
   }

   modifier onlyOwner {
      require(msg.sender == owner, "Invalid owner");
      _;
   }
}
