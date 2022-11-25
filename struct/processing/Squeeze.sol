// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

struct Squeeze {
    uint256 batchId;
    uint256 userId;
    uint256 squeezeDate;
    string squeezeAddress;
    bool squezeIsChecked;
}
