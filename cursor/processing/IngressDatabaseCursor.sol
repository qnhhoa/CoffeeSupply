// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {IngressDatabase} from "../../database/processing/IngressDatabase.sol";

abstract contract IngressDatabaseCursor {
    IngressDatabase public ingressDatabase;

    constructor(address value) {
        ingressDatabase = IngressDatabase(value);
    }
}
