pragma solidity ^0.4.21;

import "./Ownable.sol";
import "./SafeMath.sol";

contract TestdataFactory is Ownable {
    
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

    function createTestdata(string _name, uint _size) public {
        _createTestdata(_name, _size);
    }

    function getTestdataCount(address _owner) external view returns(uint) {
        return ownerDataCount[_owner];
    }

    function getTestdataByOwner(address _owner) external view returns(uint[]) {
        uint[] memory result = new uint[](ownerDataCount[_owner]);
        uint counter = 0;
        for (uint i = 0; i < testdata.length; i++) {
            if (dataToOwner[i] == _owner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }
}