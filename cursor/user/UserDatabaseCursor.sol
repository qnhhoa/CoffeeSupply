// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {UserDatabase} from "../../database/user/UserDatabase.sol";
import {User} from "../../struct/user/User.sol";

abstract contract UserDatabaseCursor {
    UserDatabase public userDatabase;

    constructor(address value) {
        userDatabase = UserDatabase(value);
    }
}