// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}


contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

//方法1
contract U is S("s"), T("t") {

}

//方法2
contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}

//方法3，混合使用
contract VV is S("s"), T {
    constructor(string memory _text) T(_text) {

    }
}

//构造函数的运行按照合约继承的顺序运行
//1.S
//2.T
//3.V0
contract V0 is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}


//1.S
//2.T
//3.V1
contract V1 is S, T {
    constructor(string memory _name, string memory _text) T(_text) S(_name) {

    }
}
