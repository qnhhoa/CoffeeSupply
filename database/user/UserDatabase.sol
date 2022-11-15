// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {User} from "../../struct/user/User.sol";

contract UserDatabase is Ownable {
    User[] private list;
    uint256 private autoIncrement = 0;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "UserDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "UserDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addUser(User memory user) public onlyPermissions {
        uint256 id = autoIncrement++;
        user.userId = id;
        list.push(user);
    }

    function addChecked(uint256 userId) public onlyPermissions {
        list[userId].userIsChecked = true;
    }

    function getAllUser() public view onlyPermissions returns (User[] memory) {
        return list;
    }
}
