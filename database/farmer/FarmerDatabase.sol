// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Farmer} from "../../struct/farmer/Farmer.sol";

contract FarmerDatabase is Ownable {
    Farmer[] private list;
    uint256 private autoIncrement = 0;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "FarmerDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "FarmerDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addFarmer(Farmer memory farmer) public onlyPermissions {
        uint256 id = autoIncrement++;
        farmer.farmerId = id;
        list.push(farmer);
    }

    function addChecked(uint256 farmerId) public onlyPermissions {
        list[farmerId].farmerIsChecked = true;
    }

    function getAllFarmer()
        public
        view
        onlyPermissions
        returns (Farmer[] memory)
    {
        return list;
    }
}
