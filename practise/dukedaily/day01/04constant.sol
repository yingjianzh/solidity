/*
常量与变量相对，需要硬编码在合约中，合约部署之后，无法改变。
常量更加节约gas，一般用大写来代表常量。
高阶用法：clone合约时，如果合约内有初始值，必须使用constant，否则clone的新合约初始值为空值。
*/

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Constants {
    address public constant MY_ADDRESS = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    uint public constant MY_UINT = 123;
}