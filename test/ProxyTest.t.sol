// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/LogicContract.sol";
import "../src/MiniProxyFactory.sol";

contract ProxyTest is Test {
    LogicContract public logic;
    MiniProxyFactory public factory;
    LogicContract public proxyLogic;

    function setUp() public {
        logic = new LogicContract();
        factory = new MiniProxyFactory();
        address proxy = factory.createProxy(address(logic));
        proxyLogic = LogicContract(proxy);
    }

    function testSetValueThroughProxy() public {
        proxyLogic.setValue(42);
        uint256 value = proxyLogic.value();
        assertEq(value, 42);
    }
}
