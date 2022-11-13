// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {AccountType} from "../AccountType.sol";

struct Importer {
    uint256 importerId;
    address importerAddress;
    AccountType accountType;
}
