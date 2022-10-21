// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {UserDatabaseCursor} from "../../cursor/signup/UserDatabaseCursor.sol";
import {User} from "../../struct/farmer/User.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {AccountType} from "../../struct/AccountType.sol";

contract UserController is Ownable, UserDatabaseCursor {
    constructor(address userDatabaseContractAddress)
        Ownable()
        UserDatabaseCursor(userDatabaseContractAddress)
    {}

    function login() public view returns (User memory) {
        User[] memory list = userDatabase.getListUsers(DATABASE_KEY);
        for (uint256 i = 0; i < list.length; i++) {
            if (list[i].userAdress == msg.sender) return list[i];
        }
        return User(0, "", 0, address(0), 0);
    }

    function addUser(
        string memory userName,
        uint256 userPhoneNumber,
        uint256 userRole
    ) public returns (bool) {
        User memory item = User(
            0,
            userName,
            userPhoneNumber,
            msg.sender,
            userRole
        );
        return userDatabase.addUser(item, DATABASE_KEY);
    }

    // function addUser(
    //     uint256 userId,
    //     string memory userName,
    //     uint256 userPhoneNumber,
    //     uint256 passWord
    // )
}
