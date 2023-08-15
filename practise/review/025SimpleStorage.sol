// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract SimpleStorage {
    uint favoriteNumber;

    struct People {
        uint age;
        string name;
    }

    People[] public person;

    function store(uint _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint) {
        return favoriteNumber;
    }


    //memory 与 calldata
    //storage/存储
    // 存储中的数据是永久存在的。存储是一个key/value库- 存储中的数据写入区块链，因此会修改状态，这也是存储使用成本高的原因。
    // 占用一个256位的槽需要消耗20000 gas
    // 修改一个已经使用的存储槽的值，需要消耗5000 gas
    // 当清零一个存储槽时，会返还一定数量的gas
    // 存储按256位的槽位分配，即使没有完全使用一个槽位，也需要支付其开销

    // memory/内存
    // 内存是一个字节数组，槽大小位256位（32字节）
    // 数据仅在函数执行期间存在，执行完毕后就被销毁
    // 读或写一个内存槽都会消耗3gas
    // 为了避免矿工的工作量过大，22个操作之后的单操作成本会上涨

    // calldata/调用数据
    // 调用数据是不可修改、非持久化的区域，用来保存函数参数，其行为类似于内存
    // 外部函数的参数必须使用calldata，但是也可用于其他变量
    // 调用数据避免了数据拷贝，并确保数据不被修改
    // 函数也可以返回使用calldata声明的数组和结果，但是不可能分配这些类型

    // memory 和 calldata 都是只存在function中参数修饰符， struct/mapping/Array 这三种类型的变量做名义参数时
    // 需要在前面加上memory/calldata

    function addPerson(uint _age, string memory _name) public {
        person.push(People(_age, _name));
    }
}