// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Function {
    //使用pure不需要读取区块链上的任何变量
    // Functions can return multiple values.
    function returnMany() public pure returns (uint, bool, uint) {
        return (1, true, 2);
    }

    
    // Return values can be named.
    function named() public pure returns (uint x, bool b, uint y) {
        return (1, true, 2);
    }

    //当我们给返回的参数指定名称的时候，可以用参数=值的方式来取代return
    // Return values can be assigned to their name.
    // In this case the return statement can be omitted.
    function assigned() public pure returns (uint x, bool b, uint y) {
        x = 1;
        b = true;
        y = 2;
    }

    // Use destructuring assignment when calling another
    // function that returns multiple values.
    function destructuringAssignments()
        public
        pure
        returns (uint, bool, uint, uint, uint)
    {
        (uint i, bool b, uint j) = returnMany();

        // Values can be left out.
        (uint x, , uint y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // Cannot use map for either input or output

    // Can use array for input
    function arrayInput(uint[] memory _arr) public {}

    // Can use array for output
    uint[] public arr;

    //当需要读取区块链上的变量的时候，需要用view
    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }
}

// Call function with key-value inputs
contract XYZ {
    function someFuncWithManyInputs(
        uint x,
        uint y,
        uint z,
        address a,
        bool b,
        string memory c
    ) public pure returns (uint) {}

    function callFunc() external pure returns (uint) {
        return someFuncWithManyInputs(1, 2, 3, address(0), true, "c");
    }

    function callFuncWithKeyValue() external pure returns (uint) {
        return
            someFuncWithManyInputs({a: address(0), b: true, c: "c", x: 1, y: 2, z: 3});
    }
}
