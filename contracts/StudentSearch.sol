//SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.0;
 
contract StudentSearch{
 
    string[] private names;
    event studentAdded(address whoAddedThisName,string message);
 
    function addNames(string memory name)public returns(string memory){
        string memory message="Student added successfully";
 
        names.push(name);
        emit studentAdded(msg.sender,message);
 
        return message;
    }
 
 
    function searchName(string memory name) public view returns(string memory){
        bool isFound=false;
        for (uint i=0; i<names.length; i++){
            if (keccak256(bytes(names[i])) == keccak256(bytes(name))){
                isFound=true;
                break;
            }
        }
 
        if (isFound){
            return string(abi.encodePacked(name," found"));        
        }else{
            return string(abi.encodePacked(name," not found"));
        }
    }
 
    function getTotalNamesCount()public view returns(uint){
        return names.length;
    }
 
 
    function getAllNames()public view returns(string[] memory){
        return names;
    }
 
}
