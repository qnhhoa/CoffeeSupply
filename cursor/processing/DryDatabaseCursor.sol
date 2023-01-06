// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {DryDatabase} from "../../database/processing/DryDatabase.sol";

abstract contract DryDatabaseCursor {
    DryDatabase public dryDatabase;

    constructor(address value) {
        dryDatabase = DryDatabase(value);
    }
}
