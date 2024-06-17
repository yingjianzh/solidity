// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Inbox {
    
    //状态变量，存在链上
    string public message;

    constructor(string memory initMessage) {
        // 本地变量
        string memory tmp = initMessage;
        message = tmp;
    }

     // 写操作，需要支付手续费
    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }

    // 读操作，不需要支付手续费
    function getMessage() public view returns(string memory) {
        return message;
    }

}