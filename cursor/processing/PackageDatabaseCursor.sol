// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {PackageDatabase} from "../../database/processing/PackageDatabase.sol";

abstract contract PackageDatabaseCursor {
    PackageDatabase public packageDatabase;

    constructor(address value) {
        packageDatabase = PackageDatabase(value);
    }
}
