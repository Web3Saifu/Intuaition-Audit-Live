// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MockMultiVault {

    function getTotalUtilizationForEpoch(uint256)
        external
        pure
        returns (uint256)
    {
        return 500;
    }

    function getTotalUtilizationTarget()
        external
        pure
        returns (uint256)
    {
        return 1000;
    }

    function getTotalBondedValueAtEpoch(uint256)
        external
        pure
        returns (uint256)
    {
        return 10000;
    }

}