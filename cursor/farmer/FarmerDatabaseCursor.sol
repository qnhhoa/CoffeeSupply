// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {FarmerDatabase} from "../../database/farmer/FarmerDatabase.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {Farmer} from "../../struct/farmer/Farmer.sol";
import {Inspector} from "../../struct/farmer/Inspector.sol";

abstract contract FarmerDatabaseCursor {
    FarmerDatabase public farmerDatabase;

    constructor(address value) {
        farmerDatabase = FarmerDatabase(value);
    }

    modifier onlyInspector() {
        require(checkInspector(), "FarmerDatabaseCursor: onlyInspector");
        _;
    }

    function checkInspector() public view returns (bool) {
        Inspector[] memory list = farmerDatabase.getListInspector(DATABASE_KEY);
        for (uint256 i = 0; i < list.length; i++) {
            if (list[i].inspectorAddress == msg.sender) return true;
        }
        return false;
    }
}
