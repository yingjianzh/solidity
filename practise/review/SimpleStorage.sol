// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract SimpleStorage {
    uint public numa; //在区块链上部署了一个名为numa的变量，占用一个位置

    function set(uint _numa) public {
        numa = _numa;
    }


    function get() public view returns(uint) {
        return numa;
    }
}