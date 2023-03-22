// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract IfElse {
    function example(uint _x) external pure returns (uint) {
        if (_x < 10) {
            return 1;
        } else if (_x < 20){
            return 2;
        }else {
            return 3;
        }
    }


    function ternay(uint _x) external pure returns (uint) {
        //三元运算符
        return _x < 10 ? 1 : 2;
    }
}