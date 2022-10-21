// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {ProcessingDatabaseCursor} from "../../cursor/processing/ProcessingDatabaseCursor.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {Stored} from "../../struct/processing/Stored.sol";
import {PreWarehouse} from "../../struct/processing/PreWarehouse.sol";
import {Processing} from "../../struct/processing/Processing.sol";
import {Processor} from "../../struct/processing/Processor.sol";
import {Inspector} from "../../struct/processing/Inspector.sol";
import {AccountType} from "../../struct/AccountType.sol";

contract ProcessingController is Ownable, ProcessingDatabaseCursor {
    constructor(address processingDatabaseContractAddress)
        Ownable()
        ProcessingDatabaseCursor(processingDatabaseContractAddress)
    {}

    function login() public view returns (Inspector memory) {
        Inspector[] memory list = processingDatabase.getListInspector(
            DATABASE_KEY
        );
        for (uint256 i = 0; i < list.length; i++) {
            if (list[i].inspectorAddress == msg.sender) return list[i];
        }
        return Inspector(0, address(0), AccountType.NONE, 0);
    }

    function addInspector(uint256 category, address inspectorAddress) public onlyOwner returns (bool) {
        Inspector memory item = Inspector(
            0,
            inspectorAddress,
            AccountType.PROCESSING_INSPECTOR,
            category
        );
        return processingDatabase.addInspector(item, DATABASE_KEY);
    }

    function addProcessor(uint256 category) public returns (bool) {
        Processor memory item = Processor(0, msg.sender, category);
        return processingDatabase.addProcessor(item, DATABASE_KEY);
    }

    function addPreWarehouse(
        uint256 processorId,
        uint256[] memory listBatchId,
        uint256 category,
        uint256 time,
        uint256 quantity
    ) public returns (bool) {
        PreWarehouse memory item = PreWarehouse(
            0,
            processorId,
            listBatchId,
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

    function addStored(
        uint256 processingId,
        uint256 category,
        uint256 time,
        uint256 quantity
    ) public returns (bool) {
        Stored memory item = Stored(
            0,
            processingId,
            category,
            time,
            quantity
        );
        return processingDatabase.addStored(item, DATABASE_KEY);
    }

    function getListInspector() public view returns (Inspector[] memory) {
        Inspector[] memory list = processingDatabase.getListInspector(
            DATABASE_KEY
        );
        for (uint256 i = 0; i < list.length; i++) {
            list[i].inspectorAddress = address(0);
        }
        return list;
    }

    function getListProcessor() public view returns (Processor[] memory) {
        return processingDatabase.getListProcessor(DATABASE_KEY);
    }

    function getListStored() public view returns (Stored[] memory) {
        return processingDatabase.getListStored(DATABASE_KEY);
    }

    function getListProcessing() public view returns (Processing[] memory) {
        return processingDatabase.getListProcessing(DATABASE_KEY);
    }

    function getListPreWarehouse() public view returns (PreWarehouse[] memory) {
        return processingDatabase.getListPreWarehouse(DATABASE_KEY);
    }
}
