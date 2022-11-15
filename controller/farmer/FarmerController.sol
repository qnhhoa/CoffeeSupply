// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {FarmerDatabaseCursor} from "../../cursor/Farmer/FarmerDatabaseCursor.sol";
import {Farmer} from "../../struct/farmer/Farmer.sol";

contract FarmerController is Ownable, FarmerDatabaseCursor {
    constructor(address FarmerDatabaseContractAddress)
        Ownable()
        FarmerDatabaseCursor(FarmerDatabaseContractAddress)
    {}

    function addFarmer(string memory farmerAddress) public {
        Farmer memory item = Farmer(0, farmerAddress, false);
        return farmerDatabase.addFarmer(item);
    }

    function getAllFarmer() public view returns (Farmer[] memory) {
        return farmerDatabase.getAllFarmer();
    }
}
