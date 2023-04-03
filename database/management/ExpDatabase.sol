// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Expiration} from "../../struct/management/expire.sol";

contract ExpDatabase is Ownable {
    Expiration[] private list;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "ExpirationDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "ExpirationDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addExpiration(Expiration memory item) public onlyPermissions {
        list.push(item);
    }

    function addChecked(uint256 batchId) public onlyPermissions {
        list[batchId].expIsChecked = true;
    }

    function getAllExpiration()
        public
        view
        onlyPermissions
        returns (Expiration[] memory)
    {
        return list;
    }
}
