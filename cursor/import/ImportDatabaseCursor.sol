// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {ImportDatabase} from "../../database/import/ImportDatabase.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {Importer} from "../../struct/farmer/Importer.sol";
// import {Inspector} from "../../struct/farmer/Inspector.sol";

abstract contract ImportDatabaseCursor {
    ImportDatabase public importDatabase;

    constructor(address value) {
        importDatabase = ImportDatabase(value);
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
