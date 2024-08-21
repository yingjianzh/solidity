/**
可以使用Interface完成多个合约之间进行交互，interface有如下特性：

接口中定义的function不能存在具体实现；
接口可以继承；
所有的function必须定义为external；
接口中不能存在constructor函数；
接口中不能定义状态变量。
abstract和interface的区别 (https://medium.com/upstate-interactive/solidity-how-to-know-when-to-use-abstract-contracts-vs-interfaces-874cab860c56)
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


interface IBase {
    function count() external view returns (uint);
}

interface ICounter is IBase {
    function increment() external;
}

//Solidity 不允许在同一个合约中有同名的变量和函数
contract Counter is ICounter {
    uint public _count;

    function increment() external override {
        _count += 1;        
    }

    function count() external view override returns (uint) {
        return _count;
    }
}


contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).count();
    }
}


// Uniswap example
interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);
}

interface UniswapV2Pair {
    function getReserves()
        external
        view
        returns (
            uint112 reserve0,
            uint112 reserve1,
            uint32 blockTimestampLast
        );
}

contract UniswapExample {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getTokenReserves() external view returns (uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (uint reserve0, uint reserve1, ) = UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1);
    }
}