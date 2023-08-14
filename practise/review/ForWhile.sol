// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract ForWhile {
    function addtotal() public pure returns(uint) {
        uint numa;
        for(uint i=0;i<50;i++){
            numa += i;
        }
        return numa;
    }
}