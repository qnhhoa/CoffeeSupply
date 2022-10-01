// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {ProcessingDatabase} from "../../database/processing/ProcessingDatabase.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {Processing} from "../../struct/processing/Processing.sol";

abstract contract ProcessingDatabaseCursor {
    ProcessingDatabase public processingDatabase;

    constructor(address value) {
        processingDatabase = ProcessingDatabase(value);
    }

    // modifier onlyProcessingUser(address user, address value) {
    //     require(
    //         _checkProcessingUser(user, value),
    //         "ListProcessingCursor: caller is not the user"
    //     );
    //     _;
    // }

    // modifier onlyProcessingIdBelongstoAddress(uint256 id) {
    //     require(
    //         _checkExistProcessingAccount(),
    //         "ListProcessingCursor: Address not belongs to the account"
    //     );
    //     require(
    //         _checkProcessingIdBelongstoAddress(id),
    //         "ListProcessingCursor: id is not belong to address"
    //     );
    //     _;
    // }
    // modifier existProcessingAccount() {
    //     require(
    //         _checkExistProcessingAccount(),
    //         "ListProcessingCursor: Not has account"
    //     );
    //     _;
    // }
    // modifier notExistProcessingAccount() {
    //     require(
    //         !_checkExistProcessingAccount(),
    //         "ListProcessingCursor: Already existed account"
    //     );
    //     _;
    // }

    // function _checkExistProcessingAccount() public view returns (bool) {
    //     uint256 id = listProcessingCursor.findProcessingIdByAddress(
    //         msg.sender,
    //         DATABASE_KEY
    //     );
    //     if (id > 0) return true;
    //     return false;
    // }

    // function _checkProcessingUser(address user, address value)
    //     internal
    //     pure
    //     returns (bool)
    // {
    //     if (user == value) return true;
    //     return false;
    // }

    // function _checkProcessingIdBelongstoAddress(uint256 id)
    //     internal
    //     view
    //     returns (bool)
    // {
    //     Processing memory item = listProcessingCursor.at(id, DATABASE_KEY);
    //     return _checkProcessingUser(item.ProcessingAddress, msg.sender);
    // }
}
