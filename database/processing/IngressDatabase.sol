// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Ingress} from "../../struct/processing/Ingress.sol";

contract IngressDatabase is Ownable {
    Ingress[] private list;
    uint256 private autoIncrement = 0;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "IngressDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "IngressDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addIngress(Ingress memory ingress) public onlyPermissions {
        uint256 id = autoIncrement++;
        ingress.batchId = id;
        list.push(ingress);
    }

    function addChecked(uint256 ingressId) public onlyPermissions {
        list[ingressId].ingressIsChecked = true;
    }

    function getAllIngress()
        public
        view
        onlyPermissions
        returns (Ingress[] memory)
    {
        return list;
    }
}
