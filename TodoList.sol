// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract TodoList {
    address owner;
    mapping(address => Task[]) public tasks;

    struct Task {
        string name;
        bool completed;
    }

    constructor() {
        owner = msg.sender;
    }

    function addTask(string memory _name) public {
        require(msg.sender == owner, "Only the owner can add tasks.");
        tasks[msg.sender].push(Task(_name, false));
    }

    function toggleCompleted(uint _index) public {
        require(msg.sender == owner, "Only the owner can update tasks.");
        require(_index < tasks[msg.sender].length, "Task index out of bounds.");
        tasks[msg.sender][_index].completed = !tasks[msg.sender][_index].completed;
    }

    function getTasks() public view returns (Task[] memory) {
        return tasks[msg.sender];
    }
}
