<img width="1230" height="645" alt="image" src="https://github.com/user-attachments/assets/4bc9fde6-f395-4bb1-91f5-abeef644bbbb" />


```markdown
# 📝 Decentralized Note Storing System (NoteChain.sol)

A simple and transparent on-chain note-taking system built with **Solidity**. This project allows anyone to store text-based notes directly on the blockchain—publicly, permanently, and securely.

---

## 🚀 Project Description

**NoteChain** is a decentralized application (dApp) designed to store and retrieve notes on the blockchain.  
Each note is linked to its creator’s wallet address, ensuring ownership and immutability.  
Once written, your note cannot be altered or deleted—preserving it forever on-chain.

This project demonstrates how decentralized storage and smart contracts can reshape everyday applications like note-taking.

---

## 💡 What It Does

- Lets users **create** and **view** text notes on-chain.
- Each note is associated with the **author's address** and a **timestamp**.
- All notes are **publicly viewable** and **permanently stored**.
- Provides a clear, educational example of using **Solidity**, **events**, and **mappings**.

---

## ✨ Features

- **Create Notes:** Add a new note on-chain that anyone can read.
- **Read Notes:** Retrieve notes by their unique ID.
- **Track Total Notes:** Check the total number of notes created.
- **Public History:** Every note remains visible with author, content, and creation time.
- **Immutable Records:** Notes cannot be modified or deleted.
- **Simple Interface:** Easy to integrate with a frontend (e.g., React, Next.js, or web3.js).

---

## 🌐 Deployed Smart Contract

**Network:** Celo (Sepolia Testnet)  
**Contract Address:** [0x7eb307d1AFaDe23845de764ADe6b063b3aDd26B9](https://celo-sepolia.blockscout.com/address/0x7eb307d1AFaDe23845de764ADe6b063b3aDd26B9)  
**View on Blockscout:** Click the link above to explore transactions and stored notes.

---

## 🧩 Smart Contract Overview

Below is the core Solidity code used for this contract.

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * Title: Decentralized Note Storing System
 * Author: (Your Name)
 *
 * Description:
 *  A simple Solidity smart contract that lets users store and view text notes on-chain.
 *  Each user can create multiple notes, which are publicly viewable and permanently stored.
 */

contract DecentralizedNotes {
    struct Note {
        uint id;
        address author;
        string content;
        uint timestamp;
    }

    uint public noteCount = 0;
    mapping(uint => Note) public notes;

    event NoteCreated(uint id, address author, string content, uint timestamp);

    function createNote(string memory _content) public {
        require(bytes(_content).length > 0, "Note content cannot be empty");

        noteCount++;
        notes[noteCount] = Note(noteCount, msg.sender, _content, block.timestamp);

        emit NoteCreated(noteCount, msg.sender, _content, block.timestamp);
    }

    function getNote(uint _id) public view returns (Note memory) {
        require(_id > 0 && _id <= noteCount, "Invalid note ID");
        return notes[_id];
    }

    function getNoteCount() public view returns (uint) {
        return noteCount;
    }
}
```

---

## 🛠️ How to Use

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/NoteChain.git
   ```
2. Install dependencies:
   ```
   npm install
   ```
3. Compile the smart contract:
   ```
   npx hardhat compile
   ```
4. Deploy to your preferred testnet (update network in `hardhat.config.js`):
   ```
   npx hardhat run scripts/deploy.js --network celoTestnet
   ```
5. Interact using Remix, web3.js, or a frontend app.

---

## 🧠 Future Improvements

- Add a frontend UI for easier interaction.  
- Support Markdown-formatted notes.  
- Enable user authentication via wallet integration.  
- Implement note encryption for private storage.  

---

## 📜 License

This project is licensed under the **MIT License**.  
See the [LICENSE](LICENSE) file for more details.

---

✨ *Created by (Your Name)* — Bringing decentralized simplicity to everyday tasks.
```

