// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {FarmerDatabase} from "../../database/farmer/FarmerDatabase.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {Farmer} from "../../struct/farmer/Farmer.sol";

abstract contract FarmerDatabaseCursor {
    FarmerDatabase public farmerDatabase;

    constructor(address value) {
        farmerDatabase = FarmerDatabase(value);
    }

    // modifier onlyFarmerUser(address user, address value) {
    //     require(
    //         _checkFarmerUser(user, value),
    //         "ListFarmerCursor: caller is not the user"
    //     );
    //     _;
    // }

    // modifier onlyFarmerIdBelongstoAddress(uint256 id) {
    //     require(
    //         _checkExistFarmerAccount(),
    //         "ListFarmerCursor: Address not belongs to the account"
    //     );
    //     require(
    //         _checkFarmerIdBelongstoAddress(id),
    //         "ListFarmerCursor: id is not belong to address"
    //     );
    //     _;
    // }
    // modifier existFarmerAccount() {
    //     require(
    //         _checkExistFarmerAccount(),
    //         "ListFarmerCursor: Not has account"
    //     );
    //     _;
    // }
    // modifier notExistFarmerAccount() {
    //     require(
    //         !_checkExistFarmerAccount(),
    //         "ListFarmerCursor: Already existed account"
    //     );
    //     _;
    // }

    // function _checkExistFarmerAccount() public view returns (bool) {
    //     uint256 id = listFarmerCursor.findFarmerIdByAddress(
    //         msg.sender,
    //         DATABASE_KEY
    //     );
    //     if (id > 0) return true;
    //     return false;
    // }

    // function _checkFarmerUser(address user, address value)
    //     internal
    //     pure
    //     returns (bool)
    // {
    //     if (user == value) return true;
    //     return false;
    // }

    // function _checkFarmerIdBelongstoAddress(uint256 id)
    //     internal
    //     view
    //     returns (bool)
    // {
    //     Farmer memory item = listFarmerCursor.at(id, DATABASE_KEY);
    //     return _checkFarmerUser(item.farmerAddress, msg.sender);
    // }
}
