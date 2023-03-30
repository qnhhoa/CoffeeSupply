// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

struct Expiration {
    uint256 batchId;
    string batchName;
    string manuDate;
    string expDate;
    uint256 keyValue;
    bool expIsChecked;
}
