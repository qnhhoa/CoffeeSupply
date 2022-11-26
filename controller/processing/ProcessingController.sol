// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {WarehouseDatabaseCursor} from "../../cursor/processing/WarehouseDatabaseCursor.sol";
import {IngressDatabaseCursor} from "../../cursor/processing/IngressDatabaseCursor.sol";
import {Warehouse} from "../../struct/processing/Warehouse.sol";
import {Ingress} from "../../struct/processing/Ingress.sol";

contract ProcessingController is
    Ownable,
    WarehouseDatabaseCursor,
    IngressDatabaseCursor
{
    constructor(
        address warehouseDatabaseContractAddress,
        address ingressDatabaseContractAddress
    )
        Ownable()
        WarehouseDatabaseCursor(warehouseDatabaseContractAddress)
        IngressDatabaseCursor(ingressDatabaseContractAddress)
    {}

    function addWarehouse(string memory warehouseAddress) public {
        Warehouse memory item = Warehouse(0, warehouseAddress, false);
        return warehouseDatabase.addWarehouse(item);
    }

    function getAllWarehouse() public view returns (Warehouse[] memory) {
        return warehouseDatabase.getAllWarehouse();
    }

    function addIngress(string memory ingressAddress) public {
        Ingress memory item = Ingress(ingressAddress, false);
        return ingressDatabase.addIngress(item);x
    }

    function getAllIngress() public view returns (Ingress[] memory) {
        return ingressDatabase.getAllIngress();
    }
}
