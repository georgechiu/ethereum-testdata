var ERC721 = artifacts.require("ERC721");
var Ownable = artifacts.require("Ownable");
var SafeMath = artifacts.require("SafeMath");
var TestdataFactory = artifacts.require("TestdataFactory");

module.exports = function(deployer) {
  deployer.deploy(Ownable);
  deployer.deploy(SafeMath);
  deployer.deploy(TestdataFactory);
};
