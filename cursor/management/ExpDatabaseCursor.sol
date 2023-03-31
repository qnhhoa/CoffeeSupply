// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {ExpDatabase} from "../../database/management/ExpDatabase.sol";

abstract contract ExpDatabaseCursor {
    ExpDatabase public expDatabase;

    constructor(address value) {
        expDatabase = ExpDatabase(value);
    }
}
