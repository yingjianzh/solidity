/**
 直接使用openzeppelin官方timelock即可！

 本质上，时间锁是用来将智能合约中的某个函数限制在一段时间内的代码。“if”语句就可以实现最简单的时间锁：
 if (block.timestamp < _timelockTime) {
    revert ErrorNotReady(block.timestamp, _timelockTime);
}

时间锁的应用场景
智能合约中的时间锁有很多潜在的应用场景，它们通常会被用在通证首次公开发行中，用于实现通证销售的一些功能。时间锁也可以被用来按照时间表授权投资资金使用，即用户只有在一段时间以后才可以取出资金。
 */