// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//接口与继承
interface User {
    function runWork() external returns(bool);
}

contract UserImpl is User {
    bool isWork;

    function runWork() external override returns(bool) {
        isWork = true;
        return isWork;
    }

    function getWork() external view returns(bool) {
        return isWork;
    }

}