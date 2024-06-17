/**
当用户发起一笔交易时，相当于向合约发送一个消息(msg)，这笔交易可能会涉及到三个重要的全局变量，具体如下：

msg.sender：表示这笔交易的调用者是谁（地址），同一个交易，不同的用户调用，msg.sender不同；
msg.value：表示调用这笔交易时，携带的ether数量，这些以太坊由msg.sender支付，转入到当前合约（wei单位整数）；
         注意：一个函数（或地址）如果想接收ether，需要将其修饰为：payable。
msg.data：表示调用这笔交易的信息，由函数签名和函数参数（16进制字符串），组成代理模式时常用msg.data（后续讲解）。
*/

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract MsgSender {

    address public owner;
    uint256 public value;
    address public caller;

    constructor() {
        //部署合约时，设置一个全局唯一的合约所有者，后面可以使用权限控制
        owner = msg.sender;    
    }
    //1. 对与合约而言，msg.sender是一个可以改变的值，并不一定是合约的创造者
    //2. 任何人调用了合约的方法，那么这笔交易中的from就是当前合约中的msg.sender
    function setValue(uint256 input) public {
        value = input;
        caller = msg.sender;
    }
}