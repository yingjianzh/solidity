/**
传递结构体

*/
pragma solidity ^0.7;
pragma experimental ABIEncoderV2;

contract TestStruct {

      struct User {
        string name;
        uint256 age;
     }

    mapping (bytes32 => User) users;

    function addUsers (User [] memory _users) public {

        for (uint i = 0; i < _users.length; i++) {

           bytes32 hash = keccak256(abi.encode(_users[i].name));
           users[hash] = _users[i];

        }
    }

    function getUser (string memory username) public view returns (User memory) {

        bytes32 hash = keccak256(abi.encode(username));

        return users[hash];
    }
}


contract StructTest {
    event Info(uint8 _type, address _addr);

    struct Token {
        uint8 tokenType;
        address tokenAddress;
    }

    function call(Token [] memory tokens) external {
        for (uint8 i = 0; i< tokens.length; i++) {
            (uint8 t, address addr) = (tokens[i].tokenType, tokens[i].tokenAddress);
            emit Info(t, addr);
        }
    }
}


/**
当结构体中有数组
    正确做法：
        先使用storage创建空的数组对象
        然后拼装对象，push到数组中
    错误做法：
        先new一个数组，拼装数据
    然后赋值到结构体中
*/