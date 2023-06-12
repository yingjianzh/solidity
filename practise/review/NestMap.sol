// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract NestMapping {
    mapping (address => mapping (uint => bool)) public nested;


    function get(address _add, uint _num) public view returns(bool) {
        //nested[_add]返回的是一个mapping方法，然后这个方法[_num]返回的是一个bool
        return nested[_add][_num];
    }

    function set(address _add, uint _num, bool _boo) public {
        nested[_add][_num] = _boo;
    }


    function deleteTest(address _add, uint _num) public {
        delete nested[_add][_num];
    }
}
