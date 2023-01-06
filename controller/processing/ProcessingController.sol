// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {WarehouseDatabaseCursor} from "../../cursor/processing/WarehouseDatabaseCursor.sol";
import {IngressDatabaseCursor} from "../../cursor/processing/IngressDatabaseCursor.sol";
import {RoughDatabaseCursor} from "../../cursor/processing/RoughDatabaseCursor.sol";
import {SquashDatabaseCursor} from "../../cursor/processing/SquashDatabaseCursor.sol";
import {DryDatabaseCursor} from "../../cursor/processing/DryDatabaseCursor.sol";
import {PackageDatabaseCursor} from "../../cursor/processing/PackageDatabaseCursor.sol";
import {Warehouse} from "../../struct/processing/Warehouse.sol";
import {Ingress} from "../../struct/processing/Ingress.sol";
import {Rough} from "../../struct/processing/Rough.sol";
import {Squash} from "../../struct/processing/Squash.sol";
import {Dry} from "../../struct/processing/Dry.sol";
import {Package} from "../../struct/processing/Package.sol";

contract ProcessingController is
    Ownable,
    WarehouseDatabaseCursor,
    IngressDatabaseCursor,
    RoughDatabaseCursor,
    SquashDatabaseCursor,
    DryDatabaseCursor,
    PackageDatabaseCursor
{
    constructor(
        address warehouseDatabaseContractAddress,
        address ingressDatabaseContractAddress,
        address roughDatabaseContractAddress,
        address squashDatabaseContractAddress,
        address dryDatabaseContractAddress,
        address packageDatabaseContractAddress
    )
        Ownable()
        WarehouseDatabaseCursor(warehouseDatabaseContractAddress)
        IngressDatabaseCursor(ingressDatabaseContractAddress)
        RoughDatabaseCursor(roughDatabaseContractAddress)
        SquashDatabaseCursor(squashDatabaseContractAddress)
        DryDatabaseCursor(dryDatabaseContractAddress)
        PackageDatabaseCursor(packageDatabaseContractAddress)
    {}

    function addWarehouse(string memory warehouseName, string memory warehouseAddress) public {
        Warehouse memory item = Warehouse(0, warehouseName, warehouseAddress, false);
        return warehouseDatabase.addWarehouse(item);
    }

    function getAllWarehouse() public view returns (Warehouse[] memory) {
        return warehouseDatabase.getAllWarehouse();
    }

    function addIngress(
        string memory userName,
        uint256 farmerCccd,
        string memory ingressDate,
        string memory ingressAddress,
        string memory contractPhoto,
        uint256 keyValue
    ) public {
        Ingress memory item = Ingress(
            0,
            userName,
            _msgSender(),
            farmerCccd,
            ingressDate,
            ingressAddress,
            contractPhoto,
            keyValue,
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
        string memory warehouseAddress,
        string memory processPhoto,
        uint256 keyValue
    ) public {
        Rough memory item = Rough(
            batchId,
            userName,
            _msgSender(),
            roughDate,
            warehouseAddress,
            processPhoto,
            keyValue,
            false
        );
        return roughDatabase.addRough(item);
    }

    function getAllRough() public view returns (Rough[] memory) {
        return roughDatabase.getAllRough();
    }

    function addSquash(
        uint256 batchId,
        string memory userName,
        string memory squashDate,
        string memory warehouseAddress,
        string memory processPhoto,
        uint256 keyValue
    ) public {
        Squash memory item = Squash(
            batchId,
            userName,
            _msgSender(),
            squashDate,
            warehouseAddress,
            processPhoto,
            keyValue,
            false
        );
        return squashDatabase.addSquash(item);
    }

    function getAllSquash() public view returns (Squash[] memory) {
        return squashDatabase.getAllSquash();
    }

    function addDry(
        uint256 batchId,
        string memory userName,
        string memory dryDate,
        string memory warehouseAddress,
        string memory processPhoto,
        uint256 keyValue
    ) public {
        Dry memory item = Dry(
            batchId,
            userName,
            _msgSender(),
            dryDate,
            warehouseAddress,
            processPhoto,
            keyValue,
            false
        );
        return dryDatabase.addDry(item);
    }

    function getAllDry() public view returns (Dry[] memory) {
        return dryDatabase.getAllDry();
    }

    function addPackage(
        uint256 batchId,
        string memory userName,
        string memory packageDate,
        string memory warehouseAddress,
        string memory processPhoto,
        uint256 keyValue
    ) public {
        Package memory item = Package(
            batchId,
            userName,
            _msgSender(),
            packageDate,
            warehouseAddress,
            processPhoto,
            keyValue,
            false
        );
        return packageDatabase.addPackage(item);
    }

    function getAllPackage() public view returns (Package[] memory) {
        return packageDatabase.getAllPackage();
    }

}
