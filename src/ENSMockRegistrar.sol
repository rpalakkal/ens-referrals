// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract ENSMockRegistrar {
    event NameRegistered(
        string name, bytes32 indexed label, address indexed owner, uint256 baseCost, uint256 premium, uint256 expires
    );

    event NameRenewed(string name, bytes32 indexed label, uint256 cost, uint256 expires);

    function register(
        string calldata name,
        address owner,
        uint256 duration,
        bytes32, /*secret*/
        address, /*resolver*/
        bytes[] calldata, /*data*/
        bool, /*reverseRecord*/
        uint16, /*ownerControlledFuses*/
        uint256 baseCost
    ) external {
        emit NameRegistered(name, bytes32(0), owner, baseCost, 0, duration + block.timestamp);
    }

    function renew(string calldata name, uint256, /*duration*/ uint256 baseCost) external {
        emit NameRenewed(name, bytes32(0), baseCost, 0);
    }
}
