// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract RandomWinnerGame is VRFConsumerBase, Ownable{
    uint256 public fee;
    bytes32 public keyHash;

    address[] public players;
    uint8 maxPlayers;
    bool public isGameStarted;
    uint256 entryFee;
    uint256 gameId;

    event gameStarted(uint256 gameId, uint8 maxPlayers, uint256 entryFee);
    event playerJoined(uint256 gameId, address player);
    event gameEnded(uint256 gameId, address winner, bytes32 requestId);

    constructor(address vrfCoordinator, address linkToken, bytes32 vrfKeyHash, uint256 vrfFee) VRFConsumerBase(vrfCoordinator, linkToken) {
        keyHash = vrfKeyHash;
        fee = vrfFee;
        gameStarted = false;
    }

}