/**
 * 我们可以使用import将本地的.sol文件或外部（github或openzeppelin等）.sol导入进来
 * 
 * 常量、函数、枚举、结构体、Error可以定义在合约之外；事件、变量不允许定义在合约之外。
 */

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

struct Point {
    uint x;
    uint y;
}

//事件不允许定义在合约之外
//event Greeting(string);

error Unauthorized(address caller);

string constant greeting = "helle word";

function add(uint x, uint y) pure returns (uint) {
    return x + y;
}

contract Foo {
    string public name = "Foo";
}