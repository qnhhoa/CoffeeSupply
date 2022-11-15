// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {ImportDatabase} from "../../database/import/ImportDatabase.sol";
import {UserDatabase} from "../../database/signup/UserDatabase.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {Importer} from "../../struct/farmer/Importer.sol";
import {User} from "../../struct/farmer/User.sol";
// import {Inspector} from "../../struct/farmer/Inspector.sol";

abstract contract ImportDatabaseCursor {
    ImportDatabase public importDatabase;
    UserDatabase private userDatabase;

    constructor(address userDatabaseContract, address importDatabaseContract){
        userDatabase = UserDatabase(userDatabaseContract);
        importDatabase = ImportDatabase(importDatabaseContract);
    }

    modifier onlyImporter() {
        require(checkImporter(), "ImportDatabaseCursor: onlyImporter");
        _;
    }

    function checkImporter() public view returns (bool) {
        Importer[] memory list = importDatabase.getListImporter(DATABASE_KEY);
        for (uint256 i = 0; i < list.length; i++) {
            if (list[i].importerAddress == msg.sender) return true;
        }
        return false;
    }
}
