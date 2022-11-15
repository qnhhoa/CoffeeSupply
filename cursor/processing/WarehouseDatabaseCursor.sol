// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {WarehouseDatabase} from "../../database/processing/WarehouseDatabase.sol";

abstract contract WarehouseDatabaseCursor {
    WarehouseDatabase public warehouseDatabase;

    constructor(address value) {
        warehouseDatabase = WarehouseDatabase(value);
    }
}
