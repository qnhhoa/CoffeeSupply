// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {ImportDatabaseCursor} from "../../cursor/import/ImportDatabaseCursor.sol";
import {Importer} from "../../struct/farmer/Importer.sol";
import {Import} from "../../struct/farmer/Import.sol";
// import {Plant, CATEGORY} from "../../struct/farmer/Plant.sol";
// import {Harvest} from "../../struct/farmer/Harvest.sol";
// import {Prepare} from "../../struct/farmer/Prepare.sol";
// import {Stored} from "../../struct/farmer/Stored.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {AccountType} from "../../struct/AccountType.sol";

contract ImportController is Ownable, ImportDatabaseCursor {
    constructor(address importDatabaseContractAddress)
        Ownable()
        ImportDatabaseCursor(importDatabaseContractAddress)
    {}

    function login() public view returns (Importer memory) {
        Importer[] memory list = importDatabase.getListImporter(DATABASE_KEY);
        for (uint256 i = 0; i < list.length; i++) {
            if (list[i].importerAddress == msg.sender) return list[i];
        }
        return Importer(0, address(0), AccountType.NONE);
    }

    // function addImporter(uint256 category, address importerAddress)
    //     public
    //     onlyOwner
    //     returns (bool)
    // {
    //     Importer memory item = Importer(
    //         0,
    //         importerAddress,
    //         AccountType.IMPORTER
    //     );
    //     return importDatabase.addImporter(item, DATABASE_KEY);
    // }

    // function addFarmer(
    //     uint256 famrerIdentifyId,
    //     string memory farmerName,
    //     uint256 farmerPhone,
    //     uint256 famrerAddress,
    //     uint256 category
    // ) public onlyInspector returns (bool) {
    //     Farmer memory item = Farmer(
    //         0,
    //         famrerIdentifyId,
    //         farmerName,
    //         farmerPhone,
    //         famrerAddress,
    //         category
    //     );
    //     return farmerDatabase.addFarmer(item, DATABASE_KEY);
    // }

    function addImport(
        uint256 userId,
        uint256 importAddress,
        uint256 importDate,
        uint256 quality
    ) public onlyImporter returns (bool) {
        Import memory item = Import(
            0,
            userId,
            importAddress,
            importDate,
            quality
        );
        return importDatabase.addImport(item, DATABASE_KEY);
    }

    // function addHarvest(
    //     uint256 farmerId,
    //     uint256 category,
    //     uint256 plantId
    // ) public onlyInspector returns (bool) {
    //     Harvest memory item = Harvest(0, farmerId, category, plantId);
    //     return farmerDatabase.addHarvest(item, DATABASE_KEY);
    // }

    // function addPrepare(
    //     uint256 farmerId,
    //     uint256 category,
    //     uint256[] memory listHarvestId
    // ) public onlyInspector returns (bool) {
    //     Prepare memory item = Prepare(0, farmerId, category, listHarvestId);
    //     return farmerDatabase.addPrepare(item, DATABASE_KEY);
    // }

    // function addStored(
    //     uint256 prepareId,
    //     uint256 category,
    //     uint256 time,
    //     uint256 quantity
    // ) public onlyInspector returns (bool) {
    //     Stored memory item = Stored(
    //         0,
    //         prepareId,
    //         category,
    //         time,
    //         quantity
    //     );
    //     return farmerDatabase.addStored(item, DATABASE_KEY);
    // }

    function getListImporter() public view returns (Importer[] memory) {
        Importer[] memory list = importDatabase.getListImporter(DATABASE_KEY);
        for (uint256 i = 0; i < list.length; i++) {
            list[i].importerAddress = address(0);
        }
        return list;
    }

    function getListImport() public view returns (Import[] memory) {
        return importDatabase.getListImport(DATABASE_KEY);
    }

//     function getListPlant() public view returns (Plant[] memory) {
//         return farmerDatabase.getListPlant(DATABASE_KEY);
//     }

//     function getListHarvest() public view returns (Harvest[] memory) {
//         return farmerDatabase.getListHarvest(DATABASE_KEY);
//     }

//     function getListPrepare() public view returns (Prepare[] memory) {
//         return farmerDatabase.getListPrepare(DATABASE_KEY);
//     }

//     function getListStored() public view returns (Stored[] memory) {
//         return farmerDatabase.getListStored(DATABASE_KEY);
//     }
}
