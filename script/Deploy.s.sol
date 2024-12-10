// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/LogicContract.sol";
import "../src/MiniProxyFactory.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();

        LogicContract logicContract = new LogicContract();
        console.log("Logic contract deployed at:", address(logicContract));

        MiniProxyFactory miniProxyFactory = new MiniProxyFactory();
        console.log("ProxyFactory contract deployed at:", address(miniProxyFactory));

        address proxy = miniProxyFactory.createProxy(address(logicContract));
        console.log("Proxy contract deployed at:", proxy);

        vm.stopBroadcast();
    }
}
