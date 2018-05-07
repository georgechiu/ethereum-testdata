pragma solidity ^0.4.19;

import "./ownable.sol";
import "./safemath.sol";

contract TestataFactory is Ownable {
    
    using SafeMath for uint256;

    event NewTestdata(uint dataId, string name);

    struct Testdata {
        string name;
        uint size;
    }

    Testdata[] public testdata;

    mapping(uint => address) public dataToOwner;
    mapping(address => uint) ownerDataCount;

    function _createTestdata(string _name, uint _size) internal {
        uint id = testdata.push(Testdata(_name, _size)) - 1;
        dataToOwner[id] = msg.sender;
        ownerDataCount[msg.sender]++;
        emit NewTestdata(id, _name);
    }

    function createTestData(string _name, uint _size) public {
        _createTestdata(_name, _size);
    }
}