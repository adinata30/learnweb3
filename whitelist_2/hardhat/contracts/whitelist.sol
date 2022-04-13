//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;
    mapping(address => bool) public whitelistedAddresses;
    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addToWhitelist() public {
        require(
            !whitelistedAddresses[msg.sender],
            "Address has been whitelisted"
        );
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "Can't add any more address to the whitelist"
        );
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}
