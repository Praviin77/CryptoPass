// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Subscription {
    uint256 public price = 0.01 ether;

    mapping(address => uint256) public expiry;

    // user subscribes for 30 days
    function subscribe() external payable {
        require(msg.value >= price, "Not enough ETH sent");

        expiry[msg.sender] = block.timestamp + 30 days;
    }

    // check if user is still subscribed
    function isSubscribed(address user) external view returns (bool) {
        return expiry[user] > block.timestamp;
    }

    // helper function
    function getExpiry(address user) external view returns (uint256) {
        return expiry[user];
    }
}