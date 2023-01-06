// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Dry} from "../../struct/processing/Dry.sol";

contract DryDatabase is Ownable {
    Dry[] private list;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "DryDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "DryDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addDry(Dry memory item) public onlyPermissions {
        list.push(item);
    }

    function addChecked(uint256 DryId) public onlyPermissions {
        list[DryId].dryIsChecked = true;
    }

    function getAllDry()
        public
        view
        onlyPermissions
        returns (Dry[] memory)
    {
        return list;
    }
}
