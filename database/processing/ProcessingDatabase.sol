// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {FolWarehouse} from "../../struct/processing/FolWarehouse.sol";
import {PreWarehouse} from "../../struct/processing/PreWarehouse.sol";
import {Processing} from "../../struct/processing/Processing.sol";
import {Processor} from "../../struct/processing/Processor.sol";
import {FolWarehouse} from "../../struct/processing/FolWarehouse.sol";
import {PreWarehouse} from "../../struct/processing/PreWarehouse.sol";

contract ProcessingDatabase is Ownable {
    Processor[] private listProcessor;
    Processing[] private listProcessing;
    FolWarehouse[] private listFolWarehouse;
    PreWarehouse[] private listPreWarehouse;

    constructor() Ownable() {}

    modifier requestSecretkey(bytes32 value) {
        require(
            value == DATABASE_KEY,
            "Database ProcessingDatabase: Secret key error"
        );
        _;
    }

    function addProcessor(Processor memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.processorId = listProcessor.length;
        listProcessor.push(item);
        return true;
    }

    function addPreWarehouse(PreWarehouse memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.batchId = listPreWarehouse.length;
        listPreWarehouse.push(item);
        return true;
    }

    function addFolWarehouse(FolWarehouse memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.batchId = listFolWarehouse.length;
        listFolWarehouse.push(item);
        return true;
    }

    function addProcessing(Processing memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.processingId = listProcessing.length;
        listProcessing.push(item);
        return true;
    }

    function getListProcessor(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (Processor[] memory)
    {
        return listProcessor;
    }

    function getListPreWarehouse(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (PreWarehouse[] memory)
    {
        return listPreWarehouse;
    }

    function getListFolWarehouse(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (FolWarehouse[] memory)
    {
        return listFolWarehouse;
    }

    function getListProcessing(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (Processing[] memory)
    {
        return listProcessing;
    }
}
