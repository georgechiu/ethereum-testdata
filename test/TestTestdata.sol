pragma solidity ^0.4.21;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/TestdataFactory.sol";

contract TestTestdata {
    TestdataFactory testdata = TestdataFactory(DeployedAddresses.TestdataFactory());

    function testCreateTestdata() public {
        uint oldCount = testdata.getTestdataCount(msg.sender);
        testdata.createTestdata("Test file", 256);
        uint newCount = testdata.getTestdataCount(msg.sender);
        Assert.equal(oldCount + 1, newCount, "Test data created successful!");
    }
}