// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract Variables {
    //通过内置的type函数获取当前的类型变量的最大值最小值
    int32 public a = type(int32).min;


    //Local 存在函数内存中，调用的时候才有     blockchain 存在链上要消耗gas global默认全局变量。整个以太坊自带的变量

    string public text = "Hello"; // 存在区块链上

    uint numa = 88;

    function dosomething() public view returns(uint, address){
        uint numb = 99;  // 内存变量   就是在调用这个函数的时候才有这个变量


        uint time = block.timestamp; // 当前区块的时间戳   全局变量

        address sender = msg.sender;  //msg.sender  调用这个函数的地址

        return (time, sender);
    }
}