// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

struct PreWarehouse {
    uint256 batchId;
    uint256 processorId;
    uint256[] listbatchId;
    uint256 category;
    uint256 time;
    uint256 quantity;
}
