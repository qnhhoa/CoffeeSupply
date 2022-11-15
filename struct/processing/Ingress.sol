// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

struct Ingress {
    uint256 batchId;
    uint256 userId;
    uint256 farmerId;
    uint256 ingressDate;
    uint256 ingressQuantity;
    bool ingressIsChecked;
}
