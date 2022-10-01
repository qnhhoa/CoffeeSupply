// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {ProcessingDatabaseCursor} from "../../cursor/processing/ProcessingDatabaseCursor.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {FolWarehouse} from "../../struct/processing/FolWarehouse.sol";
import {PreWarehouse} from "../../struct/processing/PreWarehouse.sol";
import {Processing} from "../../struct/processing/Processing.sol";
import {Processor} from "../../struct/processing/Processor.sol";

contract ProcessingController is Ownable, ProcessingDatabaseCursor {
    constructor(address processingDatabaseContractAddress)
        Ownable()
        ProcessingDatabaseCursor(processingDatabaseContractAddress)
    {}

    function addProcessor(uint256 category) public returns (bool) {
        Processor memory item = Processor(0, msg.sender, category);
        return processingDatabase.addProcessor(item, DATABASE_KEY);
    }

    function addPreWarehouse(
        uint256 processorId,
        uint256[] memory listbatchId,
        uint256 category,
        uint256 time,
        uint256 quantity
    ) public returns (bool) {
        PreWarehouse memory item = PreWarehouse(
            0,
            processorId,
            listbatchId,
            category,
            time,
            quantity
        );
        return processingDatabase.addPreWarehouse(item, DATABASE_KEY);
    }

    function addProcessing(
        uint256 processorId,
        uint256 category,
        uint256[] memory listBatchId
    ) public returns (bool) {
        Processing memory item = Processing(
            0,
            processorId,
            category,
            listBatchId
        );
        return processingDatabase.addProcessing(item, DATABASE_KEY);
    }

    function addFolWarehouse(
        uint256 processingId,
        uint256 category,
        uint256 time,
        uint256 quantity
    ) public returns (bool) {
        FolWarehouse memory item = FolWarehouse(
            0,
            processingId,
            category,
            time,
            quantity
        );
        return processingDatabase.addFolWarehouse(item, DATABASE_KEY);
    }

    function getListProcessor() public view returns (Processor[] memory) {
        return processingDatabase.getListProcessor(DATABASE_KEY);
    }

    function getListFolWarehouse() public view returns (FolWarehouse[] memory) {
        return processingDatabase.getListFolWarehouse(DATABASE_KEY);
    }

    function getListProcessing() public view returns (Processing[] memory) {
        return processingDatabase.getListProcessing(DATABASE_KEY);
    }

    function getListPreWarehouse() public view returns (PreWarehouse[] memory) {
        return processingDatabase.getListPreWarehouse(DATABASE_KEY);
    }
}
