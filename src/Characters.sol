// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "lib/openzeppelin-contracts/contracts/security/ReentrancyGuard.sol";
import "lib/chainlink/contracts/src/v0.8/VRFV2WrapperConsumerBase.sol";


abstract contract CharactersParams {
    uint16 public gasLimit = 100000;
    uint16 public maxSupply;
    uint16 public supplyCounter;
    uint private randomResult;
    uint constant mintPrice = 0.1 ether;
    address public chainlinkToken = 0x514910771AF9Ca656af840dff83E8264EcF986CA;
    address public vrfCoordinator = 0x271682DEB8C4E0901D1a1550aD2e64D568E69909;
    bytes32 private keyHash;
}

contract Characters is  CharactersParams, ERC721, ReentrancyGuard, VRFV2WrapperConsumerBase{

    constructor(uint16 _newSupply) ERC721("Character", "CHAR") VRFV2WrapperConsumerBase(chainlinkToken, vrfCoordinator) {
        maxSupply = _newSupply;
    }

    function getRandomNumber() internal returns(uint256 _requestId) {
        return requestRandomness(gasLimit, keyHash, 1);
    }

    function rawFulfillRandomWords(uint256 _requestId, uint256[] memory _randomWords) internal override returns(uint256 _randomResult);




}