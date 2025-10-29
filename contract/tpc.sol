// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotePoll {

    address public owner;
    string[] public candidates;

    mapping(uint => uint) public votes;
    mapping(address => bool) public voted;

    constructor() {
        owner = msg.sender;

        // Predefined candidates
        candidates.push("Alice");
        candidates.push("Bob");
        candidates.push("Charlie");
    }

    function vote(uint index) public {
        require(!voted[msg.sender], "Already voted!");
        require(index < candidates.length, "Invalid candidate!");

        votes[index]++;
        voted[msg.sender] = true;
    }

    function getVotes(uint index) public view returns (uint) {
        require(index < candidates.length, "Invalid candidate!");
        return votes[index];
    }

    function getCandidates() public view returns (string[] memory) {
        return candidates;
    }
}
  
