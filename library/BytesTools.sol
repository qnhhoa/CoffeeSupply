// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

library BytesTool {
    function toString(bytes memory value)
        internal
        pure
        returns (string memory)
    {
        return string(value);
    }
}
