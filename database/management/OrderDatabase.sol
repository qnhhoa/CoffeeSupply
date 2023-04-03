// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Order} from "../../struct/management/order.sol";

contract OrderDatabase is Ownable {
    Order[] private list;
    uint256 private autoIncrement = 0;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "OrderDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "OrderDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addOrder(Order memory order) public onlyPermissions {
        uint256 id = autoIncrement++;
        order.batchId = id;
        list.push(order);
    }

    function addChecked(uint256 orderId) public onlyPermissions {
        list[orderId].orderIsChecked = true;
    }

    function getAllOrder()
        public
        view
        onlyPermissions
        returns (Order[] memory)
    {
        return list;
    }
}
