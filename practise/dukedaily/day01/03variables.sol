/*
以太坊一共有三种类型的变量

- **状态变量（state）**
  - 定义在合约内，函数外
  - 存储在链上
- **本地变量（local）**
  - 定义在函数内
  - 不会存储在链上
- **全局变量（global）**
  - 与当前合约无关，描述整个区块链的信息（时间、块高等）
*/

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Variables {

    // State variables are stored on the blockchain.
    string public msg = "hello";

    uint public age = 26;

    function test() public view {
        // Local variable
        uint i = 256;

        // Global variables
        uint blockTime = block.timestamp; 
        address sender = msg.sender;
    }

    // Corrected function to fetch block timestamp and sender's address
    function getTest() public view returns (uint, address) {
        // Global variables
        uint blockTime = block.timestamp;  
        address sender = msg.sender;

        return (blockTime, sender);
    }
}