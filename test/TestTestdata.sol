pragma solidity ^0.4.21;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/strings.sol";
import "../contracts/TestdataFactory.sol";

contract TestTestdata {
    using strings for *;
    TestdataFactory testdata = TestdataFactory(DeployedAddresses.TestdataFactory());

    function testCreateTestdata() public {
        uint oldCount = testdata.getTestdataCount(msg.sender);
        testdata.createTestdata("Test file", 256);
        uint newCount = testdata.getTestdataCount(msg.sender);
        string msg = "Old count: ".toSlice().concat(new string(oldCount).toSlice());
        msg = msg.toSlice().concat(", new count: ".toSlice());
        msg = msg.toSlice().concat(new string(newCount).toSlice());
        Assert.equal(oldCount + 1, newCount, msg);
    }
}