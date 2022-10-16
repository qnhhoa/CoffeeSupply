// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {DATABASE_KEY} from "../../constant/SecretKey.sol";
import {User} from "../../struct/farmer/User.sol";

contract UserDatabase is Ownable {
    User[] private listUsers;

    constructor() Ownable() {}

    modifier requestSecretkey(bytes32 value) {
        require(
            value == DATABASE_KEY,
            "Database FarmerDatabase: Secret key error"
        );
        _;
    }

    function addUser(User memory item, bytes32 secret)
        public
        requestSecretkey(secret)
        returns (bool)
    {
        item.userId = listUsers.length;
        listUsers.push(item);
        return true;
    }

    function getListUsers(bytes32 secret)
        public
        view
        requestSecretkey(secret)
        returns (User[] memory)
    {
        return listUsers;
    }
}