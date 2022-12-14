// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

struct Package {
    uint256 batchId;
    string userName;
    address userAddress;
    string packageDate;
    string warehouseAddress;
    string processPhoto;
    uint256 keyValue;
    bool packageIsChecked;
}
