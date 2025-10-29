````markdown
# 🪶 NoteChain – Decentralized Note Storing System

A simple and beginner-friendly **Solidity smart contract** that allows users to create and store personal notes directly on the **blockchain**.  
Built for learners and developers who want to understand how decentralized data storage works — clean, minimal, and fully transparent.

---

<img width="1531" height="722" alt="image" src="https://github.com/user-attachments/assets/bc160bdd-9871-40f1-ae12-73dbe6a062f6" />


## 🚀 Project Description

**NoteChain** is a decentralized note-keeping system that demonstrates how to store data permanently on-chain using Solidity.  
Instead of saving notes on centralized servers, this project writes them directly to the blockchain — ensuring they are **immutable**, **transparent**, and **publicly accessible**.

It’s a great starting point for beginners in **Web3** and **Ethereum-compatible networks** (like **Celo**, **Polygon**, or **Ethereum Testnets**).

---

## 💡 What It Does

- Lets users **create text notes** stored securely on the blockchain.  
- Records:
  - ✍️ The author’s wallet address  
  - 📝 The note’s text content  
  - ⏰ The timestamp of creation  
- Each note is given a **unique ID** for easy retrieval.  
- Anyone can **view all notes** stored on the blockchain.

---

## ✨ Features

✅ **Decentralized Storage** – No central database; all notes live on the blockchain.  
✅ **Immutable Records** – Once created, notes can’t be altered or removed.  
✅ **Transparency** – Anyone can verify notes and their creators.  
✅ **Ownership** – Notes are permanently tied to the author’s wallet address.  
✅ **Beginner-Friendly Solidity Code** – Perfect for learning smart contract basics.  

---

## 🔗 Deployed Smart Contract

**Network:** [Celo Sepolia Testnet](https://celo-sepolia.blockscout.com/)  
**Deployment Transaction:**  
[https://celo-sepolia.blockscout.com/address/0x7eb307d1AFaDe23845de764ADe6b063b3aDd26B9](https://celo-sepolia.blockscout.com/address/0x7eb307d1AFaDe23845de764ADe6b063b3aDd26B9)


**Contract Address:** `XXX`  
*(Replace this with the verified address once available.)*

---

## 🧠 Smart Contract Code

```solidity
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
    // Structure to store individual notes
    struct Note {
        uint id;
        address author; // Who created the note
        string content; // The text of the note
        uint timestamp; // When it was created
    }

    uint public noteCount = 0; // Track total number of notes
    mapping(uint => Note) public notes; // Store all notes by ID

    // Event emitted when a note is created
    event NoteCreated(uint id, address author, string content, uint timestamp);

    // Function to create a new note
    function createNote(string memory _content) public {
        require(bytes(_content).length > 0, "Note content cannot be empty");

        noteCount++;
        notes[noteCount] = Note(noteCount, msg.sender, _content, block.timestamp);

        emit NoteCreated(noteCount, msg.sender, _content, block.timestamp);
    }

    // Retrieve a note by ID
    function getNote(uint _id) public view returns (Note memory) {
        require(_id > 0 && _id <= noteCount, "Invalid note ID");
        return notes[_id];
    }

    // Retrieve all notes (for simplicity, use frontend to loop noteCount)
    function getNoteCount() public view returns (uint) {
        return noteCount;
    }
}
````

---

## 🧰 How to Test the Contract

### 1. Open Remix IDE

Visit [Remix Ethereum IDE](https://remix.ethereum.org/)

### 2. Create a New File

Name it `NoteChain.sol`

### 3. Paste the Code

Paste the Solidity code from above.

### 4. Compile

Use Solidity version **0.8.20** or compatible.

### 5. Deploy

* Choose **Remix VM** (for local testing), or
* **Injected Provider (MetaMask)** to deploy on a live testnet such as **Celo Sepolia**.

### 6. Interact

* **Create a note:**
  `createNote("Hello from NoteChain!")`
* **Retrieve it:**
  `getNote(1)` → returns author, content, and timestamp.

---

## 🧭 Future Roadmap

🌱 Add ability to **edit or delete** notes by their author.
🔐 Integrate **encryption** for private note storage.
🗂️ Use **IPFS** for storing long or media-rich notes.
💻 Create a **React / Next.js front-end** to interact with the contract easily.

---

## 👨‍💻 Author

Built with ❤️ using **Solidity** and deployed on **Celo Sepolia Testnet**.
Designed to help beginners understand how blockchain-based data storage works.
Perfect as your **first Web3 project**!

---
