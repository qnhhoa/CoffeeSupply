// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {OrderDatabase} from "../../database/management/OrderDatabase.sol";

abstract contract OrderDatabaseCursor {
    OrderDatabase public orderDatabase;

    constructor(address value) {
        orderDatabase = OrderDatabase(value);
    }
}
