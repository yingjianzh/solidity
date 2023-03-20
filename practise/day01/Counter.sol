// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Counter {
    uint public count;

    function inc() external {
        count += 1;
    }

    function dex() external {
        count -= 1;
    }
}