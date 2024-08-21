/**
EIP: Ethereum Improvement Propose
任何遵从EIP-20协议（ERC20标准）的Contract都属于ERC20 Token
标准接口：
// 6 REQUIRED FUNCTIONS
function totalSupply() public view returns (uint256)
function balanceOf(address _owner) public view returns (uint256 balance)
function transfer(address _to, uint256 _value) public returns (bool success)
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
function approve(address _spender, uint256 _value) public returns (bool success)
function allowance(address _owner, address _spender) public view returns (uint256 remaining)

// 2 REQUIRED EVENTS
event Transfer(address indexed _from, address indexed _to, uint256 _value)
event Approval(address indexed _owner, address indexed _spender, uint256 _value)

// 3. OPTIONAL FUNCTIONS
function name() public view returns (string)
function symbol() public view returns (string)
function decimals() public view returns (uint8)
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol
// interface IERC20 {
//       // 6 REQUIRED FUNCTIONS
//       // 总发行量
//     function totalSupply() external view returns (uint);  // -> 总发行量 100000000 * 10**decimals

//       // 标准decimal： 18
//       // USDT: 6
//       // WBTC: 8
//     function balanceOf(address account) external view returns (uint); // 指定账户的余额

//     // 币的持有人直接调用，进行转账
//     function transfer(address recipient, uint amount) external returns (bool);

//       // 最常用的！！
//       // 1. 我这个owner对合约进行approve，此时approve内部会修改allowance变量
//       // 2. 合约内部调用transferFrom来支配owner的token
//     function transferFrom( // spender就是这个合约
//         address sender,    // owner
//         address recipient,    // 转给谁
//         uint amount // 金额
//     ) external returns (bool);


//     // owner: 币的持有人
//       // spender: 是指定帮助花费的代理人（被授权的人）
//     function allowance(address owner, address spender) external view returns (uint); // 授权的额度

//     // decimals view，这是一个public 的变量，自动提供了一个读取的方法 // 返回精度
//       // 持有人对spender进行授权，在approve内部，会调用msg.sender来知道owner是谁
//     function approve(address spender, uint amount) external returns (bool);

//       // 2 REQUIRED EVENTS
//       // 事件
//     event Transfer(address indexed from, address indexed to, uint value);
//     event Approval(address indexed owner, address indexed spender, uint value);

//     // 3. OPTIONAL FUNCTIONS
//     // function name() public view returns (string);
//     // function symbol() public view returns (string);
//     // function decimals() public view returns (uint8);
// }


//可以使用openzeppelin库进行创建自己的token：

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, 100 * 10**uint(decimals()));
    }

    //默认是18，可以进行override
    function decimals() public view override returns (uint8) {
        return 6;
    }
}