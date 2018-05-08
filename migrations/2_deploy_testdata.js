var TestdataFactory = artifacts.require("TestdataFactory");

module.exports = function(deployer) {
  deployer.deploy(TestdataFactory);
};
