// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {FarmerDatabaseCursor} from "../../cursor/farmer/FarmerDatabaseCursor.sol";
import {Farmer} from "../../struct/farmer/Farmer.sol";
import {Plant, CATEGORY} from "../../struct/farmer/Plant.sol";
import {Harvest} from "../../struct/farmer/Harvest.sol";
import {Prepare} from "../../struct/farmer/Prepare.sol";
import {FolWarehouse} from "../../struct/farmer/FolWarehouse.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";

contract FarmerController is Ownable, FarmerDatabaseCursor {
    constructor(address farmerDatabaseContractAddress)
        Ownable()
        FarmerDatabaseCursor(farmerDatabaseContractAddress)
    {}

    function addFarmer(uint256 category) public returns (bool) {
        Farmer memory item = Farmer(0, msg.sender, category);
        return farmerDatabase.addFarmer(item, DATABASE_KEY);
    }

    function addPlant(
        uint256 farmerId,
        CATEGORY category,
        uint256 testTime,
        uint256 area,
        uint256 production
    ) public returns (bool) {
        Plant memory item = Plant(
            0,
            farmerId,
            category,
            testTime,
            area,
            production
        );
        return farmerDatabase.addPlant(item, DATABASE_KEY);
    }

    function addHarvest(
        uint256 farmerId,
        uint256 category,
        uint256 plantId
    ) public returns (bool) {
        Harvest memory item = Harvest(0, farmerId, category, plantId);
        return farmerDatabase.addHarvest(item, DATABASE_KEY);
    }

    function addPrepare(
        uint256 farmerId,
        uint256 category,
        uint256[] memory listHarvestId
    ) public returns (bool) {
        Prepare memory item = Prepare(0, farmerId, category, listHarvestId);
        return farmerDatabase.addPrepare(item, DATABASE_KEY);
    }

    function addFolWarehouse(
        uint256 prepareId,
        uint256 category,
        uint256 time,
        uint256 quantity
    ) public returns (bool) {
        FolWarehouse memory item = FolWarehouse(
            0,
            prepareId,
            category,
            time,
            quantity
        );
        return farmerDatabase.addFolWarehouse(item, DATABASE_KEY);
    }

    function getListFarmer() public view returns (Farmer[] memory) {
        return farmerDatabase.getListFarmer(DATABASE_KEY);
    }

    function getListPlant() public view returns (Plant[] memory) {
        return farmerDatabase.getListPlant(DATABASE_KEY);
    }

    function getListHarvest() public view returns (Harvest[] memory) {
        return farmerDatabase.getListHarvest(DATABASE_KEY);
    }

    function getListPrepare() public view returns (Prepare[] memory) {
        return farmerDatabase.getListPrepare(DATABASE_KEY);
    }

    function getListFolWarehouse() public view returns (FolWarehouse[] memory) {
        return farmerDatabase.getListFolWarehouse(DATABASE_KEY);
    }
}
