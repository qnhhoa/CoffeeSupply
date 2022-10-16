// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {UserDatabase} from "../../database/signup/UserDatabase.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {User} from "../../struct/farmer/User.sol";

abstract contract UserDatabaseCursor {
    UserDatabase public userDatabase;

    constructor(address value) {
        userDatabase = UserDatabase(value);
    }

    // modifier onlyInspector() {
    //     require(checkInspector(), "FarmerDatabaseCursor: onlyInspector");
    //     _;
    // }

    // function checkInspector() public view returns (bool) {
    //     Inspector[] memory list = farmerDatabase.getListInspector(DATABASE_KEY);
    //     for (uint256 i = 0; i < list.length; i++) {
    //         if (list[i].inspectorAddress == msg.sender) return true;
    //     }
    //     return false;
    // }
}