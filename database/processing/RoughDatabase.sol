// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Rough} from "../../struct/processing/Rough.sol";

contract RoughDatabase is Ownable {
    Rough[] private list;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "RoughDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "RoughDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addRough(Rough memory Rough) public onlyPermissions {
        list.push(Rough);
    }

    function addChecked(uint256 RoughId) public onlyPermissions {
        list[RoughId].RoughIsChecked = true;
    }

    function getAllRough()
        public
        view
        onlyPermissions
        returns (Rough[] memory)
    {
        return list;
    }
}
