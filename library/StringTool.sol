// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

library StringTool {
    function equal(string memory a, string memory b)
        internal
        pure
        returns (bool)
    {
        if (keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b)))
            return true;
        else return false;
    }

    // function encodeBytes32(string memory value)
    //     internal
    //     pure
    //     returns (bytes32)
    // {
    //     return bytes32(keccak256(abi.encodePacked(value)));
    // }

    // function encodeBytes8(string memory value) internal pure returns (bytes8) {
    //     return bytes8(keccak256(abi.encodePacked(value)));
    // }

    function toBytes(string memory value) internal pure returns (bytes memory) {
        return bytes(value);
    }

    //newer v0.8.12
    function concat(string memory a, string memory b)
        internal
        pure
        returns (string memory)
    {
        return string.concat(a, b);
    }

    //fewer gas
    function append(string memory a, string memory b)
        internal
        pure
        returns (string memory)
    {
        return string(abi.encodePacked(a, b));
    }
}
