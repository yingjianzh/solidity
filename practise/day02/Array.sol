// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract Array {
    uint[] public nums = [1, 2, 3];

    uint[3] public numsFixed = [4, 5, 6];


    function examples() external {
        nums.push(4); // [1,2,3,4]  动态数组 push
        uint x = nums[1];
        nums[2] = 777; // [1,2,777,4]

        delete nums[1]; // [1,0,777,4]   delete 不能减少数组的长度

        nums.pop(); //[1,0,777]

        uint len = nums.length;


        uint[] memory a = new uint[](5); //内存中不能创建动态数组
        
        a[1] = 123;
    }


    function returnArray() external view returns (uint[] memory){
        return nums;
    }


}