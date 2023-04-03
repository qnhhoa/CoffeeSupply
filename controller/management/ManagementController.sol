// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {OrderDatabaseCursor} from "../../cursor/management/OrderDatabaseCursor.sol";
import {ExpDatabaseCursor} from "../../cursor/management/ExpDatabaseCursor.sol";
import {Expiration} from "../../struct/management/expire.sol";
import {Order} from "../../struct/management/order.sol";

contract ManagementController is
    Ownable,
    OrderDatabaseCursor,
    ExpDatabaseCursor
{
    constructor(
        address orderDatabaseContractAddress,
        address expDatabaseContractAddress
    )
        Ownable()
        OrderDatabaseCursor(orderDatabaseContractAddress)
        ExpDatabaseCursor(expDatabaseContractAddress)
    {}

    function addOrder(
        uint256 batchId,
        string memory batchName,
        string memory userName,
        string memory deliveryDate,
        uint256 prices,
        string memory status,
        string memory orderAddress,
        string memory phoneNumber,
        uint256 keyValue
    ) public {
        Order memory item = Order(
            0,
            batchId,
            batchName,
            userName,
            _msgSender(),
            deliveryDate,
            prices,
            status,
            orderAddress,
            phoneNumber,
            keyValue,
            false
        );
        return orderDatabase.addOrder(item);
    }

    function getAllOrder() public view returns (Order[] memory) {
        return orderDatabase.getAllOrder();
    }

    function addExpiration(
        uint256 batchId,
        string memory batchName,
        string memory manuDate,
        string memory expDate,
        uint256 keyValue
    ) public {
        Expiration memory item = Expiration(
            batchId,
            batchName,
            manuDate,
            expDate,
            keyValue,
            false
        );
        return expDatabase.addExpiration(item);
    }

    function getAllExpiration() public view returns (Expiration[] memory) {
        return expDatabase.getAllExpiration();
    }
}
