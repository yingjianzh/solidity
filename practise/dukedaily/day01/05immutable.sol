/**
不可变量immutable
与常量类似，但是不必硬编码，可以在构造函数时传值，部署后无法改变。
immutable仅支持值类型（如：int，address，bytes8），不支持非值类型（如：string，bytes）
*/

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Immutable {
    
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;
    bytes1 public immutable MY_BYTES1;
    
    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}