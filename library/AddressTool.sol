// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

library AddressTool {
    function toString(address value) internal pure returns (string memory) {
        return string(abi.encodePacked(value));
    }

    function toUint256(address value) internal pure returns (uint256) {
        return uint256(uint160(value));
    }
}
