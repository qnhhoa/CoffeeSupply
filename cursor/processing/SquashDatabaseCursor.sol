// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {SquashDatabase} from "../../database/processing/SquashDatabase.sol";

abstract contract SquashDatabaseCursor {
    SquashDatabase public squashDatabase;

    constructor(address value) {
        squashDatabase = SquashDatabase(value);
    }
}
