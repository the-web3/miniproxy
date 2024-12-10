// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MiniProxyFactory {
    event ProxyCreated(address proxyAddress);

    function createProxy(address implementation) external returns (address) {
        bytes memory bytecode = abi.encodePacked(
            hex"3d602d80600a3d3981f3",
            hex"363d3d373d3d3d363d73",
            implementation,
            hex"5af43d82803e903d91602b57fd5bf3"
        );
        address proxy;
        assembly {
            proxy := create(0, add(bytecode, 0x20), mload(bytecode))
        }
        require(proxy != address(0), "Proxy creation failed");
        emit ProxyCreated(proxy);
        return proxy;
    }
}
