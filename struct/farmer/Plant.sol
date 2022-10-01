// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

enum CATEGORY {
    NONE,
    ROBUSTA,
    ARABICA
}

struct Plant {
    uint256 plantId;
    uint256 farmerId;
    CATEGORY category;
    uint256 testTime;
    uint256 area;
    uint256 production;
}
