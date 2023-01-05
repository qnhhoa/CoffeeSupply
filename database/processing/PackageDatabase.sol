// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Package} from "../../struct/processing/Package.sol";

contract PackageDatabase is Ownable {
    Package[] private list;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "PackageDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "PackageDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addPackage(Package memory item) public onlyPermissions {
        list.push(item);
    }

    function addChecked(uint256 PackageId) public onlyPermissions {
        list[PackageId].packageIsChecked = true;
    }

    function getAllPackage()
        public
        view
        onlyPermissions
        returns (Package[] memory)
    {
        return list;
    }
}
