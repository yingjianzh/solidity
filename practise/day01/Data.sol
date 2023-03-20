// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//Solidity中的变量类型
//数值类型(Value Type)：包括布尔型，整数型等等，这类变量赋值时候直接传递数值。

//引用类型(Reference Type)：包括数组和结构体，这类变量占空间大，赋值时候直接传递地址（类似指针）。

//映射类型(Mapping Type): Solidity里的哈希表。

//函数类型(Function Type)：Solidity文档里把函数归到数值类型，但我觉得他跟其他类型差别很大，所以单独分一类
contract ValueTypes {
    bool public b = true;

    uint public u = 123; // uint = uint256 0 to 2**256 -1
                         //        uint8   0 to 2**8 -1
                         //        uint16  0 to 2**16 -1
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    address public addr = 0x9550757ce0C7Eb68bc7e54576D21c10bC160EfA2;
    bytes32 public b32 = 0x3b90d26369a4de84f7fad96eed258c48fd809de1600913016847c6f6c25214b4;
}