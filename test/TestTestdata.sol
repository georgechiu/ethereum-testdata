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
        string memory error_msg = "Old count: ".toSlice().concat((new string(oldCount)).toSlice());
        error_msg = error_msg.toSlice().concat(", new count: ".toSlice());
        error_msg = error_msg.toSlice().concat((new string(newCount)).toSlice());
        Assert.equal(oldCount + 1, newCount, error_msg);
    }

    function testGetTestdata() public {
        uint expected = testdata.getTestdataCount(this);
        uint[] memory data = testdata.getTestdata(this);
        Assert.equal(expected, data.length, "Here is a error.");
    }
}