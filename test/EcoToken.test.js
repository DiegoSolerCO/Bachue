const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("EcoToken", function () {
  let EcoToken, ecoToken, owner, addr1, addr2;

  beforeEach(async () => {
    EcoToken = await ethers.getContractFactory("EcoToken");
    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
    ecoToken = await EcoToken.deploy();
    await ecoToken.deployed();
  });

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      expect(await ecoToken.platformOwner()).to.equal(owner.address);
    });
  });

  // Add more tests for the EcoToken contract here
});
