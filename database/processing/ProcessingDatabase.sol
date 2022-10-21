// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {Stored} from "../../struct/processing/Stored.sol";
import {PreWarehouse} from "../../struct/processing/PreWarehouse.sol";
import {Processing} from "../../struct/processing/Processing.sol";
import {Processor} from "../../struct/processing/Processor.sol";
import {PreWarehouse} from "../../struct/processing/PreWarehouse.sol";
import {Inspector} from "../../struct/processing/Inspector.sol";

contract ProcessingDatabase is Ownable {
    Inspector[] private listInspector;
    Processor[] private listProcessor;
    Processing[] private listProcessing;
    Stored[] private listStored;
    PreWarehouse[] private listPreWarehouse;

    constructor() Ownable() {}

    modifier requestSecretkey(bytes32 value) {
        require(
            value == DATABASE_KEY,
            "Database ProcessingDatabase: Secret key error"
        );
        _;
    }

    function addInspector(Inspector memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.inspectorId = listInspector.length;
        listInspector.push(item);
        return true;
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

    function addStored(Stored memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.batchId = listStored.length;
        listStored.push(item);
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

    function getListInspector(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (Inspector[] memory)
    {
        return listInspector;
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

    function getListStored(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (Stored[] memory)
    {
        return listStored;
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
