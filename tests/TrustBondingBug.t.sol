// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";

import "../src/protocol/emissions/TrustBonding.sol";
import "./mocks/MockEmissionsController.sol";
import "./mocks/MockMultiVault.sol";

contract TrustBondingBugTest is Test {

    TrustBonding bonding;
    MockEmissionsController controller;
    MockMultiVault vault;

    function setUp() public {

        controller = new MockEmissionsController(1000);
        vault = new MockMultiVault();

        bonding = new TrustBonding();

        bonding.initialize(
            address(controller),
            address(vault),
            address(this),
            1 days,
            100
        );
    }

    function test_UnclaimedRewardsMismatch() public {

        uint256 epoch = 10;

        vm.store(
            address(bonding),
            keccak256(abi.encode(epoch, uint256(6))),
            bytes32(uint256(400))
        );

        uint256 unclaimed = bonding.getUnclaimedRewardsForEpoch(epoch);

        assertEq(unclaimed, 600);
    }
}