// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {AccountType} from "../AccountType.sol";

struct Inspector {
    uint256 inspectorId;
    address inspectorAddress;
    AccountType accountType;
    uint256 category;
}
