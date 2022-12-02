// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {RoughDatabase} from "../../database/processing/RoughDatabase.sol";

abstract contract RoughDatabaseCursor {
    RoughDatabase public roughDatabase;

    constructor(address value) {
        roughDatabase = RoughDatabase(value);
    }
}
