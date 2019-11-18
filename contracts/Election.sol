pragma solidity ^0.5.0;

/**
 * The Election contract does this and that...
 */
contract Election {
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}
	mapping(uint => Candidate) public candidates;
	uint public candidatesCount;
	mapping(address => bool) public voters;
	//voted event event votedEvent(uint indexed _condidateId);

	constructor() public {
		addCandidate("Anny");
		addCandidate("Downy");
	}
	function addCandidate (string memory _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function vote (uint _condidateId) public {
		//require (!voters[msg.sender]);
		//require (_condidateId > 0 && _condidateId <= candidatesCount);
		voters[msg.sender] = true;

		candidates[_condidateId].voteCount++;

		//emit votedEvent(_condidateId);
	}
}