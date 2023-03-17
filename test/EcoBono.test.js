const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("EcoBono", function () {
  let EcoBono, ecoBono, owner, addr1, addr2;

  beforeEach(async () => {
    EcoBono = await ethers.getContractFactory("EcoBono");
    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
    ecoBono = await EcoBono.deploy();
    await ecoBono.deployed();
  });

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      expect(await ecoBono.platformOwner()).to.equal(owner.address);
    });
  });

  // Add more tests for the EcoBono contract here
});
