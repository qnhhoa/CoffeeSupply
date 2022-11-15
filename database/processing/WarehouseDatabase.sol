// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Warehouse} from "../../struct/processing/Warehouse.sol";

contract WarehouseDatabase is Ownable {
    Warehouse[] private list;
    uint256 private autoIncrement = 0;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "WarehouseDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "WarehouseDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addWarehouse(Warehouse memory warehouse) public onlyPermissions {
        uint256 id = autoIncrement++;
        warehouse.warehouseId = id;
        list.push(warehouse);
    }

    function addChecked(uint256 warehouseId) public onlyPermissions {
        list[warehouseId].warehouseIsChecked = true;
    }

    function getAllWarehouse()
        public
        view
        onlyPermissions
        returns (Warehouse[] memory)
    {
        return list;
    }
}
