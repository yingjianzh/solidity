// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Error1 {
    // Require should be used to validate conditions such as:  require关键字主要用于验证以下条件
    // - inputs  输入
    // - conditions before execution   执行前的条件是否满足
    // - return values from calls to other functions   其他函数返回值是否满足条件
    function testRequire(uint _i) public pure {
        require(_i>10, "i must greated than Ten!");
    }


    function testRevert(uint _i) public pure {
        if(_i <= 10) {
            revert("input must greater than 10!");
        }
    }


    uint public num = 20;


    function testAssert() public view {
        // Assert should only be used to test for internal errors,
        // and to check invariants.   只能用于测试内部错误和不变量

        // Here we assert that num is always equal to 0
        // since it is impossible to update the value of num
        assert(num == 0);
    }

    // custom error
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }

}