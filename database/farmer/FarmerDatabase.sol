// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {Farmer} from "../../struct/farmer/Farmer.sol";
import {Plant} from "../../struct/farmer/Plant.sol";
import {Harvest} from "../../struct/farmer/Harvest.sol";
import {Prepare} from "../../struct/farmer/Prepare.sol";
import {Inspector} from "../../struct/farmer/Inspector.sol";
import {Stored} from "../../struct/farmer/Stored.sol";

contract FarmerDatabase is Ownable {
    Inspector[] private listInspector;
    Farmer[] private listFarmer;
    Plant[] private listPlant;
    Harvest[] private listHarvest;
    Prepare[] private listPrepare;
    Stored[] private listStored;

    constructor() Ownable() {}

    modifier requestSecretkey(bytes32 value) {
        require(
            value == DATABASE_KEY,
            "Database FarmerDatabase: Secret key error"
        );
        _;
    }

    function addInspector(Inspector memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.inspectorId = listInspector.length;
        listInspector.push(item);
        return true;
    }

    function addFarmer(Farmer memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.farmerId = listFarmer.length;
        listFarmer.push(item);
        return true;
    }

    function addPlant(Plant memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.plantId = listPlant.length;
        listPlant.push(item);
        return true;
    }

    function addHarvest(Harvest memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.harvestId = listHarvest.length;
        listHarvest.push(item);
        return true;
    }

    function addPrepare(Prepare memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.prepareId = listPrepare.length;
        listPrepare.push(item);
        return true;
    }

    function addStored(Stored memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.batchId = listStored.length;
        listStored.push(item);
        return true;
    }

    function getListInspector(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (Inspector[] memory)
    {
        return listInspector;
    }

    function getListFarmer(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (Farmer[] memory)
    {
        return listFarmer;
    }

    function getListPlant(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (Plant[] memory)
    {
        return listPlant;
    }

    function getListHarvest(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (Harvest[] memory)
    {
        return listHarvest;
    }

    function getListPrepare(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (Prepare[] memory)
    {
        return listPrepare;
    }

    function getListStored(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (Stored[] memory)
    {
        return listStored;
    }
}
