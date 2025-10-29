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
