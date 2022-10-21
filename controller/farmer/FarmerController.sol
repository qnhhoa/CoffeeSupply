// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {FarmerDatabaseCursor} from "../../cursor/farmer/FarmerDatabaseCursor.sol";
import {Inspector} from "../../struct/farmer/Inspector.sol";
import {Farmer} from "../../struct/farmer/Farmer.sol";
import {Plant, CATEGORY} from "../../struct/farmer/Plant.sol";
import {Harvest} from "../../struct/farmer/Harvest.sol";
import {Prepare} from "../../struct/farmer/Prepare.sol";
import {Stored} from "../../struct/farmer/Stored.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {AccountType} from "../../struct/AccountType.sol";

contract FarmerController is Ownable, FarmerDatabaseCursor {
    constructor(address farmerDatabaseContractAddress)
        Ownable()
        FarmerDatabaseCursor(farmerDatabaseContractAddress)
    {}

    function login() public view returns (Inspector memory) {
        Inspector[] memory list = farmerDatabase.getListInspector(DATABASE_KEY);
        for (uint256 i = 0; i < list.length; i++) {
            if (list[i].inspectorAddress == msg.sender) return list[i];
        }
        return Inspector(0, address(0), AccountType.NONE, 0);
    }

    function addInspector(uint256 category, address inspectorAddress)
        public
        onlyOwner
        returns (bool)
    {
        Inspector memory item = Inspector(
            0,
            inspectorAddress,
            AccountType.FARMER_INSPECTOR,
            category
        );
        return farmerDatabase.addInspector(item, DATABASE_KEY);
    }

    function addFarmer(
        uint256 famrerIdentifyId,
        string memory farmerName,
        uint256 farmerPhone,
        uint256 famrerAddress,
        uint256 category
    ) public onlyInspector returns (bool) {
        Farmer memory item = Farmer(
            0,
            famrerIdentifyId,
            farmerName,
            farmerPhone,
            famrerAddress,
            category
        );
        return farmerDatabase.addFarmer(item, DATABASE_KEY);
    }

    function addPlant(
        uint256 farmerId,
        CATEGORY category,
        uint256 testTime,
        uint256 area,
        uint256 production
    ) public onlyInspector returns (bool) {
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
    ) public onlyInspector returns (bool) {
        Harvest memory item = Harvest(0, farmerId, category, plantId);
        return farmerDatabase.addHarvest(item, DATABASE_KEY);
    }

    function addPrepare(
        uint256 farmerId,
        uint256 category,
        uint256[] memory listHarvestId
    ) public onlyInspector returns (bool) {
        Prepare memory item = Prepare(0, farmerId, category, listHarvestId);
        return farmerDatabase.addPrepare(item, DATABASE_KEY);
    }

    function addStored(
        uint256 prepareId,
        uint256 category,
        uint256 time,
        uint256 quantity
    ) public onlyInspector returns (bool) {
        Stored memory item = Stored(
            0,
            prepareId,
            category,
            time,
            quantity
        );
        return farmerDatabase.addStored(item, DATABASE_KEY);
    }

    function getListInspector() public view returns (Inspector[] memory) {
        Inspector[] memory list = farmerDatabase.getListInspector(DATABASE_KEY);
        for (uint256 i = 0; i < list.length; i++) {
            list[i].inspectorAddress = address(0);
        }
        return list;
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

    function getListStored() public view returns (Stored[] memory) {
        return farmerDatabase.getListStored(DATABASE_KEY);
    }
}
