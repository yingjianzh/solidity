// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract Mapping {
    //Maps are created with the syntax mapping(keyType => valueType).

    //The keyType can be any built-in value type, bytes, string, or any contract.

    //valueType can be any type including another mapping or an array.
    mapping (address => uint) public myMap;

    function getByAdd(address _add) public view returns(uint) {
        //返回的是这个mapping 方法对应的数，如果没有则返回默认值（0）
        return myMap[_add];
    }

    function set(address _add, uint _i) public {
        myMap[_add] = _i;
    }


    function deleteNum(address _add) public {
        //delete 就是把每个地址匹配的值恢复为初始值
        delete myMap[_add];
    }
}