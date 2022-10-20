// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
// import "@0xsequence/create3/contracts/Create3.sol";
import "https://github.com/0xsequence/create3/blob/master/contracts/Create3.sol";


    struct person {
            string name;
            uint256 age;
        }


contract A {
  function deployChild() external {
    
    person memory p = person({name: "Ukeme", age: 24});
    Create3.create3(keccak256(bytes("Salsa")), abi.encodePacked(type(B).creationCode, abi.encode(p)), 2000000000000000000);
  }

  function showAddress(string memory _salt) external view returns(address deployed){
    deployed = Create3.addressOf(keccak256(bytes(_salt)));

  }
}

contract B {

    person private p;

    constructor(person memory _person) {
        p = _person;

    }
  }
