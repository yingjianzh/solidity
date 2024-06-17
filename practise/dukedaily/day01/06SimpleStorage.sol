/*
读写状态变量
1. 写状态变量（上链）是一笔交易（tx），需要矿工打包，所以需要花费资金；
2. 读取状态变量，是从账本中获取数据，不是一笔交易，所以免费。（必须加上view）
*/

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract SImpleStorage {

    uint public num;

    function set(uint _num) public {
        num = _num;
    }

    function get() public view returns (uint) {
        return num;
    }
}