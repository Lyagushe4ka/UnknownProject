// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "lib/openzeppelin-contracts/contracts/security/ReentrancyGuard.sol";

abstract contract CharactersParams {
    uint16 maxSupply;
}

contract Characters is  CharactersParams, ERC721, ReentrancyGuard {

    constructor(uint16 _newSupply) ERC721("Character", "CHAR") {
        maxSupply = _newSupply;
    }
}