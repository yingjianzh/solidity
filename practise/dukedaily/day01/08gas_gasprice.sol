/**
gas描述执行一笔交易时需要花费多少ether！（1 ether = 10^18wei)

交易手续费 = gas_used * gas_price，其中：

gas：是数量单位，uint
gas_used：表示一笔交易实际消耗的gas数量
gas_price：每个gas的价格，单位是wei或gwei
gas limit：表示你允许这一笔交易消耗的gas上限，用户自己设置（防止因为bug导致的损失）
如果gas_used小于gas_limit，剩余gas会返回给用户，这个值不再合约层面设置，在交易层面设置（如metamask）
如果gas_used大于gas_limit，交易失败，资金不退回
block gas limit：表示一个区块能够允许的最大gas数量，由区块链网络设置
*/