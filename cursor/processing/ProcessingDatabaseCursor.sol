// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {ProcessingDatabase} from "../../database/processing/ProcessingDatabase.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {Processing} from "../../struct/processing/Processing.sol";
import {Inspector} from "../../struct/processing/Inspector.sol";

abstract contract ProcessingDatabaseCursor {
    ProcessingDatabase public processingDatabase;

    constructor(address value) {
        processingDatabase = ProcessingDatabase(value);
    }

    modifier onlyInspector() {
        require(checkInspector(), "FarmerDatabaseCursor: onlyInspector");
        _;
    }

    function checkInspector() public view returns (bool) {
        Inspector[] memory list = processingDatabase.getListInspector(
            DATABASE_KEY
        );
        for (uint256 i = 0; i < list.length; i++) {
            if (list[i].inspectorAddress == msg.sender) return true;
        }
        return false;
    }
}
