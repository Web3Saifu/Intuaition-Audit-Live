// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MockEmissionsController {

    uint256 public emission;

    constructor(uint256 _emission) {
        emission = _emission;
    }

    function getEmissionsAtEpoch(uint256) external view returns (uint256) {
        return emission;
    }

}