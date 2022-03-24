//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist{
    uint8 public maxWhitelist;
    mapping(address=>bool) public whitelistAddress;   
    uint8 public numWhitelisted;

    constructor(uint8 _maxWhitelist){
        maxWhitelist = _maxWhitelist;
    }

    function addToWhitelist() public{
        require(!whitelistAddress[msg.sender],"Address has been whitelisted");
        require(numWhitelisted<maxWhitelist,"Can't add any more address to the whitelist");
        whitelistAddress[msg.sender] = true;
        numWhitelisted+=1;
    }

    
}