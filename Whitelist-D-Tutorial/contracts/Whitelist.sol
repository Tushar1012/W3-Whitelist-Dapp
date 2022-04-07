//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
contract Whitelist {
    uint8 public maxWhitelistedAddresss;
    //mapping
    mapping(address => bool) public whitelistedAddress;

     // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    //setting the max number of whitelisted address
    //user will put the value at the time of deployment

    constructor(uint8 _maxWhitelistedAddresss){
        maxWhitelistedAddresss = _maxWhitelistedAddresss;
    }
    //addAddressToWhitelist - This function adds the address of the sender to the whitelist

    function addAddressToWhitelist() public {
        //check if the user is already been whitelisted
        //msg.sendar is the address of ths user who called this function

        require(!whitelistedAddress[msg.sender], "Sender has already been varified");
         // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(numAddressesWhitelisted < maxWhitelistedAddresss, "More addresses cant be added, limit reached");

        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddress[msg.sender] = true;
        // Increase the number of whitelisted address 
        numAddressesWhitelisted += 1;
    }

}