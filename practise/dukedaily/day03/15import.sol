// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import "./15import/Foo.sol";


import {Unauthorized, add as func, Point} from "./15import/Foo.sol";


contract Import {

    Foo public foo = new Foo();


    function getFooName() public view returns (string memory) {
        return foo.name();
    }
    
    function myAdd() public pure returns(uint) {
        return func(1,2);
    }

    function greetingCall() public pure returns(string memory) {
        return greeting;
    }

}
/**
 * 导入外部文件
 * // https://github.com/owner/repo/blob/branch/path/to/Contract.sol
import "https://github.com/owner/repo/blob/branch/path/to/Contract.sol";

// Example import ECDSA.sol from openzeppelin-contract repo, release-v4.5 branch
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol";
 */