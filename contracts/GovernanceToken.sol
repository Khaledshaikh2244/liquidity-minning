// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract GovernanceToken is ERC20, Ownable {
    constructor() ERC20('Govenance Token' , 'GTK') Ownable() {}
    
    function mint (address to , uint amount ) external onlyOwner() {
        //making use of _mint fnction provided by ERC token of Openzeppelin
        _mint(to , amount);
        }
    
}

