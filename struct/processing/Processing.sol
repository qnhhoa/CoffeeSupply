// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

struct Processing {
    uint256 processingId;
    uint256 processorId;
    uint256 category;
    uint256[] listBatchId;
}
