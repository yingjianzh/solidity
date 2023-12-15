// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Overload {
    //重载
    function saySomething() public pure returns(string memory) {
        return "nothing";
    }

    function saySomething(string memory something) public pure returns(string memory){
        return (something);
    }

    /*
    在调用重载函数时，会把输入的实际参数和函数参数的变量类型做匹配。
    如果出现多个匹配的重载函数，则会报错。下面这个例子有两个叫`f()`的函数，一个参数为`uint8`，另一个为`uint256`：
   */
    function f(uint8 _in) public pure returns (uint8 out) {
        out = _in;
    }

    function f(uint256 _in) public pure returns (uint256 out) {
        out = _in;
    }
}