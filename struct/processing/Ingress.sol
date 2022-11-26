// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

struct Ingress {
    uint256 batchId;
    uint256 userName;
    uint256 farmerName;
    uint256 ingressDate;
    string ingressAddress;
    bool ingressIsChecked;
}
