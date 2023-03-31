// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

struct Order {
    uint256 batchId;
    string batchName;
    string userName;
    address userAccount;
    string deliveryDate;
    uint256 prices;
    string status;
    string orderAddress;
    string phoneNumber;
    uint256 keyValue;
    bool orderIsChecked;
}
