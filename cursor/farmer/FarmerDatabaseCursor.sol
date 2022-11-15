// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {FarmerDatabase} from "../../database/farmer/FarmerDatabase.sol";

abstract contract FarmerDatabaseCursor {
    FarmerDatabase public farmerDatabase;

    constructor(address value) {
        farmerDatabase = FarmerDatabase(value);
    }
}
