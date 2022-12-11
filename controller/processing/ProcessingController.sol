// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {WarehouseDatabaseCursor} from "../../cursor/processing/WarehouseDatabaseCursor.sol";
import {IngressDatabaseCursor} from "../../cursor/processing/IngressDatabaseCursor.sol";
import {RoughDatabaseCursor} from "../../cursor/processing/RoughDatabaseCursor.sol";
import {Warehouse} from "../../struct/processing/Warehouse.sol";
import {Ingress} from "../../struct/processing/Ingress.sol";
import {Rough} from "../../struct/processing/Rough.sol";

contract ProcessingController is
    Ownable,
    WarehouseDatabaseCursor,
    IngressDatabaseCursor,
    RoughDatabaseCursor
{
    constructor(
        address warehouseDatabaseContractAddress,
        address ingressDatabaseContractAddress,
        address roughDatabaseContractAddress
    )
        Ownable()
        WarehouseDatabaseCursor(warehouseDatabaseContractAddress)
        IngressDatabaseCursor(ingressDatabaseContractAddress)
        RoughDatabaseCursor(roughDatabaseContractAddress)
    {}

    function addWarehouse(string memory warehouseAddress) public {
        Warehouse memory item = Warehouse(0, warehouseAddress, false);
        return warehouseDatabase.addWarehouse(item);
    }

    function getAllWarehouse() public view returns (Warehouse[] memory) {
        return warehouseDatabase.getAllWarehouse();
    }

    function addIngress(
        string memory userName,
        string memory farmerName,
        string memory ingressDate,
        string memory ingressAddress,
        string memory contractPhoto
    ) public {
        Ingress memory item = Ingress(
            0,
            userName,
            _msgSender(),
            farmerName,
            ingressDate,
            ingressAddress,
            contractPhoto,
            false
        );
        return ingressDatabase.addIngress(item);
    }

    function getAllIngress() public view returns (Ingress[] memory) {
        return ingressDatabase.getAllIngress();
    }

    function addRough(
        uint256 batchId,
        string memory userName,
        string memory roughDate,
        string memory roughAddress
    ) public {
        Rough memory item = Rough(
            batchId,
            userName,
            _msgSender(),
            roughDate,
            roughAddress,
            false
        );
        return roughDatabase.addRough(item);
    }

    function getAllRough() public view returns (Rough[] memory) {
        return roughDatabase.getAllRough();
    }
}
