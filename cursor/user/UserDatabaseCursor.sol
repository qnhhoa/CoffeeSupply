// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {UserDatabase} from "../../database/user/UserDatabase.sol";
import {User} from "../../struct/user/User.sol";

abstract contract UserDatabaseCursor {
    UserDatabase public userDatabase;

    constructor(address value) {
        userDatabase = UserDatabase(value);
    }

    modifier onlyNotExistUser() {
        require(
            !checkExistUser(),
            "UserDatabaseCursor: 300:  only not exist user"
        );
        _;
    }

    function checkExistUser() public view returns (bool) {
        User[] memory list = userDatabase.getAllUser();
        for (uint256 i = 0; i < list.length; i++) {
            if (list[i].userAddress == msg.sender) return true;
        }
        return false;
    }
}
