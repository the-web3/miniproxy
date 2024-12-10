// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract LogicContract {
    uint256 public value;

    function setValue(uint256 _value) external {
        value = _value;
    }
}
