const EcoToken = artifacts.require("EcoToken");

module.exports = function (deployer) {
  deployer.deploy(EcoToken);
};
