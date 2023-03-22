// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract FunctionModifier {
    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }


    modifier whenNotPaused() {
        require(!paused, "paused");
        _;
    }

    function inc() external whenNotPaused {
        require(!paused, "paused");
        count += 1;
    }


    function dec() external whenNotPaused {
        require(!paused, "paused");
        count -= 1;
    }


    modifier cap(uint _x) {
        require(_x < 100, "x >= 100");
        _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x) {
        count += _x;
    }


    modifier sandwich() {
        
        // code here
        count += 10;
        _; //表示其他的要执行的代码
        // more code here
        count *= 2;
    }

    function foo() external sandwich {
        count += 1;
    }

}
