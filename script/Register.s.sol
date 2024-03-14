// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Script, console2 } from "forge-std/Script.sol";
import { ENSMockRegistrar } from "../src/ENSMockRegistrar.sol";

contract Register is Script {
    function setUp() public { }

    function run() public {
        ENSMockRegistrar r = ENSMockRegistrar(0x74B4f05c75b47035bfc41BdA77440f9c6c05e5AE);
        bytes[] memory data = new bytes[](1);
        vm.startBroadcast();
        r.register("test", address(0), uint256(1), bytes32(0), address(0), data, false, uint16(0), uint256(10_000_000));
        vm.stopBroadcast();
    }
}
