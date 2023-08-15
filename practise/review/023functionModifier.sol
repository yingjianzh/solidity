// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract FunctionModifier {
    address public owner;
    uint public x = 10;
    bool public locked;


    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "you are not owner;");
        _;   //代表函数主体
    }

    modifier validAddress(address _addr) {
        require(_addr != address(0), "not valid Address;");
        _;
    }

    function modifyOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    //函数修饰符可以在函数主体之前调用，也可以在函数主体之后甚至是中间调用


    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }



}