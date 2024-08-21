/**
permit接口
    根据EIP-2612的提议，对于ERC20的先授权，再transferFrom模式，用户EOA需要进行两笔交易操作，这样浪费资源，且交互不友好，解决方式是在原有的ERC20接口中，增加一个perimit接口，这个接口可以接收链下的签名（r, s, v)，在内部进行校验，如果校验通过后可以进行approve操作。
    这个签名中会描述授权给谁进行帮忙approve，被授权的人在合约中可以一次调用approve和transferFrom，从而完成：通过一笔交易而完成转账动作。
*/

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

interface IERC20Permit {
    function totalSupply() external view returns (uint);

    function balanceOf(address account) external view returns (uint);

    function transfer(address recipient, uint amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);

    function permit(
        address owner,
        address spender,
        uint value,
        uint deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}
/**
1.EIP-712: Typed structured data hashing and signing
2.EIP-2612: permit – 712-signed approvals
3.https://eips.ethereum.org/EIPS/eip-191
具体实现逻辑中，主要包含两个功能：

对签名进行校验
校验deadline
获取签名的信息（一个hash值，我们对hash值签名，而不是对原内容签名）
使用v，r，s签名，对签名信息进行校验，能够解析出来签名地址。
调用approve（或者直接操作allowance）
下面是uniswapV2的LPToken中的permit实现：

function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external {

          // 第一部分
          // 1. 校验deadline
        require(deadline >= block.timestamp, 'UniswapV2: EXPIRED');

          // 2. 获取签名的信息（一个hash值，我们对hash值签名，而不是对原内容签名）
        bytes32 digest = keccak256(
            abi.encodePacked(
                '\x19\x01',
                DOMAIN_SEPARATOR,
                keccak256(abi.encode(PERMIT_TYPEHASH, owner, spender, value, nonces[owner]++, deadline))
            )
        );

          // 3. 使用签名，对签名信息进行校验，能够解析出来签名地址。
        address recoveredAddress = ecrecover(digest, v, r, s);

          // 4. 校验签名地址是否有效
        require(recoveredAddress != address(0) && recoveredAddress == owner, 'UniswapV2: INVALID_SIGNATURE'); // onwer入参，这个token的所有者，授权给spender花费

          // 第二部分
        _approve(owner, spender, value);
    }
*/
