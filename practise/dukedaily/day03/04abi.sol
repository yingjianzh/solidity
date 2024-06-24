/**
abi.encode：可以将data编码成bytes，生成的bytes总是32字节的倍数，不足32为会自动填充（用于给合约调用）；
abi.decode：可以将bytes解码成data（可以只解析部分字段）
abi.encodePacked：与abi.encode类似，但是生成的bytes是压缩过的（有些类型不会自动填充，无法传递给合约调用）。
手册：https://docs.soliditylang.org/en/v0.8.13/abi-spec.html?highlight=abi.encodePacked#non-standard-packed-mode
*/

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract AbiDecode {
    struct MyStruct {
        string name;
        uint[2] nums;
    }


    // input: 10, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, [1,"2",3], ["duke", [10,20]]
    // output: 0x000000000000000000000000000000000000000000000000000000000000000a0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc40000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000000000014000000000000000000000000000000000000000000000000000000000000000064756b6500000000000000000000000000000000000000000000000000000000
    //  output长度：832位16进制字符（去除0x)，832 / 32 = 26 （一定是32字节的整数倍，不足填0）
    function encode(
        uint x,
        address addr,
        uint[] calldata arr,
        MyStruct calldata myStruct
    ) external pure returns (bytes memory) {
        return abi.encode(x, addr, arr, myStruct);
    }

    function decode(bytes calldata data)
        external
        pure
        returns (
            uint x,
            address addr,
            uint[] memory arr,
            MyStruct memory myStruct
        )
    {
        (x, addr, arr, myStruct) = abi.decode(data, (uint, address, uint[], MyStruct));

        /* decode output: 
            0: uint256: x 10
            1: address: addr 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
            2: uint256[]: arr 1,2,3
            3: tuple(string,uint256[2]): myStruct ,10,20
        */
    }

    // 可以只decode其中部分字段，而不用全部decode，当前案例中，只有第一个字段被解析了，其余为默认值
    function decodeLess(bytes calldata data)
        external
        pure
        returns (
            uint x,
            address addr,
            uint[] memory arr,
            MyStruct memory myStruct
        )
    {
        (x) = abi.decode(data, (uint));

        /* decode output: 
            0: uint256: x 10
            1: address: addr 0x0000000000000000000000000000000000000000
            2: uint256[]: arr
            3: tuple(string,uint256[2]): myStruct ,0,0
        */
    }

    // input: -1, 0x42, 0x03, "Hello, world!"
    function encodePacked(
        int16 x,
        bytes1 y,
        uint16 z,
        string memory s
    ) external view returns (bytes memory) {

        // encodePacked 不支持struct和mapping
        return abi.encodePacked(x, y, z, s);

        /*
        0xffff42000348656c6c6f2c20776f726c6421
          ^^^^                                 int16(-1)
              ^^                               bytes1(0x42)
                ^^^^                           uint16(0x03)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^ string("Hello, world!") without a length field
        */
    }
  
  	// 可以用encodePacked来拼接字符串
  	// output string: ipfs://bafybeidmrsvehl4ehipm5qqvgegi33r6/100.json
  	function encodePackedTest() public  pure returns (string memory) {
        string memory uri = "ipfs://bafybeidmrsvehl4ehipm5qqvgegi33r6/";
        return string(abi.encodePacked(uri, "100", ".json"));
    }
}