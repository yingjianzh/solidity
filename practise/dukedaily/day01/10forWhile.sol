/**
solidity支持for, while, do while循环；
尽量不要使用没有边界的循环，因为会导致达到gas limit，进而导致交易执行失败，因此很少使用while和do while
*/

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Loop {
    function loop() {
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                continue;
            }
            if (i == 5) {
                break;
            }
        }

        uint j;
        while (j < 10) {
            j++;
        }
    }
}