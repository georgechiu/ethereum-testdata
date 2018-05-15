pragma solidity ^0.4.21;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/strings.sol";
import "../contracts/TestdataFactory.sol";

contract TestTestdata {
    using strings for *;
    TestdataFactory testdata = TestdataFactory(DeployedAddresses.TestdataFactory());

    function testCreateTestdata() public {
        testdata.createTestdata("Test file", 256);
    }

    function testGetTestdataCount() public {
        // todo
    }

    function testGetTestdata() public {
        uint expected = testdata.getTestdataCount(this);
        uint[] memory data = testdata.getTestdata(this);
        Assert.equal(expected, data.length, "Here is a error.");
    }
}