// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Order} from "../../struct/management/order.sol";

contract OrderDatabase is Ownable {
    Order[] private list;

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

    function addOrder(Order memory item) public onlyPermissions {
        list.push(item);
    }

    function addChecked(uint256 OrderId) public onlyPermissions {
        list[OrderId].orderIsChecked = true;
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
