// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Squash} from "../../struct/processing/Squash.sol";

contract SquashDatabase is Ownable {
    Squash[] private list;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "SquashDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "SquashDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addSquash(Squash memory item) public onlyPermissions {
        list.push(item);
    }

    function addChecked(uint256 SquashId) public onlyPermissions {
        list[SquashId].squashIsChecked = true;
    }

    function getAllSquash()
        public
        view
        onlyPermissions
        returns (Squash[] memory)
    {
        return list;
    }
}
