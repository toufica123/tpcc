# 🗳️ VotePoll Smart Contract

A simple decentralized voting system built using **Solidity** that allows users to vote for predefined candidates.  
Each address can only vote once, and votes are publicly viewable on the blockchain.

![VotePoll Screenshot](Screenshot%202025-10-29%20141859.png)

---

## 📜 Contract Information

- **Network:** Celo Sepolia Testnet  
- **Contract Address / Deployment Tx:**  
  [View on Blockscout](https://celo-sepolia.blockscout.com/tx/0xeb74212169157df86d9e2ca489231e8843fc5e14f6ed318910aca20d9c5694d4)

---

## ⚙️ Features

- Predefined candidates: **Alice**, **Bob**, **Charlie**  
- Each wallet address can vote **only once**  
- Publicly accessible vote counts  
- Easy retrieval of candidate list  

---

## 🧩 Smart Contract Code

```solidity
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
