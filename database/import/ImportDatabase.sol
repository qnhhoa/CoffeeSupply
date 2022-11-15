// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {Import} from "../../struct/farmer/Import.sol";
// import {Plant} from "../../struct/farmer/Plant.sol";
// import {Harvest} from "../../struct/farmer/Harvest.sol";
// import {Prepare} from "../../struct/farmer/Prepare.sol";
import {Importer} from "../../struct/farmer/Importer.sol";
// import {Stored} from "../../struct/farmer/Stored.sol";

contract ImportDatabase is Ownable {
    Importer[] private listImporter;
    Import[] private listImport;
    uint256 private autoIncrement = 0;
    // Plant[] private listPlant;
    // Harvest[] private listHarvest;
    // Prepare[] private listPrepare;
    // Stored[] private listStored;

    constructor() Ownable() {}

    modifier requestSecretkey(bytes32 value) {
        require(
            value == DATABASE_KEY,
            "Database FarmerDatabase: Secret key error"
        );
        _;
    }

    function addImporter(Importer memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.importerId = listImporter.length;
        listImporter.push(item);
        return true;
    }

    function addImport(Import memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.importerId = listImport.length;
        listImport.push(item);
        uint256 id = ++autoIncrement;
        list.push(Warehouse(id, title));
        return true;
    }

    // function addPlant(Plant memory item, bytes32 secret)
    //     public
    //     requestSecretkey(secret)
    //     returns (bool)
    // {
    //     item.plantId = listPlant.length;
    //     listPlant.push(item);
    //     return true;
    // }

    // function addHarvest(Harvest memory item, bytes32 secret)
    //     public
    //     requestSecretkey(secret)
    //     returns (bool)
    // {
    //     item.harvestId = listHarvest.length;
    //     listHarvest.push(item);
    //     return true;
    // }

    // function addPrepare(Prepare memory item, bytes32 secret)
    //     public
    //     requestSecretkey(secret)
    //     returns (bool)
    // {
    //     item.prepareId = listPrepare.length;
    //     listPrepare.push(item);
    //     return true;
    // }

    // function addStored(Stored memory item, bytes32 secret)
    //     public
    //     requestSecretkey(secret)
    //     returns (bool)
    // {
    //     item.batchId = listStored.length;
    //     listStored.push(item);
    //     return true;
    // }

    function getListImporter(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (Importer[] memory)
    {
        return listImporter;
    }

    function getListImport(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (Import[] memory)
    {
        return listImport;
    }

//     function getListPlant(bytes32 secret)
//         public
//         view
//         requestSecretkey(secret)
//         returns (Plant[] memory)
//     {
//         return listPlant;
//     }

//     function getListHarvest(bytes32 secret)
//         public
//         view
//         requestSecretkey(secret)
//         returns (Harvest[] memory)
//     {
//         return listHarvest;
//     }

//     function getListPrepare(bytes32 secret)
//         public
//         view
//         requestSecretkey(secret)
//         returns (Prepare[] memory)
//     {
//         return listPrepare;
//     }

//     function getListStored(bytes32 secret)
//         public
//         view
//         requestSecretkey(secret)
//         returns (Stored[] memory)
//     {
//         return listStored;
//     }
}
