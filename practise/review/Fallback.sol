// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//Solidity支持两种特殊的回调函数，receive()和fallback()，他们主要在两种情况下被使用：

// 接收ETH
// 处理合约中不存在的函数调用（代理合约proxy contract）
// 注意：在Solidity 0.6.x版本之前，语法上只有 fallback() 函数，用来接收用户发送的ETH时调用以及在被调用函数签名没有匹配到时，来调用。 0.6版本之后，Solidity才将 fallback() 函数拆分成 receive() 和 fallback() 两个函数。

contract Fallback {
    /* 触发fallback() 还是 receive()?
           接收ETH
              |
         msg.data是空？
            /  \
          是    否
          /      \
receive()存在?   fallback()
        / \
       是  否
      /     \
receive()  fallback   
    */

    // 定义事件
    event receivedCalled(address Sender, uint Value);
    event fallbackCalled(address Sender, uint Value, bytes Data);

    // 接收ETH时释放Received事件
    receive() external payable {
        emit receivedCalled(msg.sender, msg.value);
    }

    // fallback
    fallback() external payable{
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }
}