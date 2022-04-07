const { ethers } = require("hardhat");
async function main() {
  const whilelistContract = await ethers.getContractFactory("Whitelist");
  //here we deploy the contract
    
  const deployedWhitelistContract = await whilelistContract.deploy(10);
  // 10 is the maximum number of whitelisted addrress allowed

  //wait for if to finish deploying
  await deployedWhitelistContract.deployed();

  //print the address of the deplyed contract
  console.log("whitelist contract Address to  :", deployedWhitelistContract.address);
}

// call the main function and catch it there is any error

main()
  .then(() => process.exit(0))
  .catch((error) => { 
    console.error(error);
    process.exit(1);
});
