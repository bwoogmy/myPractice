// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.8.0) (token/ERC20/ERC20.sol)
pragma solidity ^0.8.0;



contract Valuta {


uint public _totalSupply;
string public _name;
string public _symbol;
address public owner;


mapping(address => uint256) public balances;
mapping(address => mapping(address => uint256)) public allowence;

constructor(string memory name_, string memory symbol_, uint tokenTotalSupply) {
        _name = name_;
        _symbol = symbol_;
        _totalSupply = tokenTotalSupply;
        balances[msg.sender] = tokenTotalSupply;
        owner = msg.sender;
    }

function name() public view returns (string memory) {
        return _name;
    }
function symbol() public view returns (string memory) {
        return _symbol;
    }

function totalSupply() public view returns (uint){
    return _totalSupply;
}

function balanceOf( address account) public view returns (uint){
    return balances [account];
}


function transfer(address to, uint256 amount) public returns (bool) {
        balances[msg.sender] = balances[msg.sender] - amount;
        balances[to] = balances[msg.sender] + amount;
        return true;
    }

function approve (address _sender, uint amount) public {
    allowence[msg.sender][_sender] = amount;
}

function transferFrom(address _from, address _to, uint amount) public {
    require(allowence[_from][_to] >= amount, "not enogh amount");
    balances[_from] = balances[_from] - amount;
    balances[_to] += amount;
    allowence[_from][_to] -= amount;
    
 }




}