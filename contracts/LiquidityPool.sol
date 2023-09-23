// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import './UnderlyingToken.sol';
import './LpToken.sol';
import './GovernanceToken.sol';

contract LiquidityPool is LpToken {
    mapping (address => uint ) public checkpoints;
    UnderlyingToken public underlyingToken;//creating pointers to smartcontracrs
    GovernanceToken public governanceToken;
    uint constant public REWARD_PER_BLOCK =1;
    
    constructor  (address _underlyingToken , address _governancetoken) {
        underlyingToken = UnderlyingToken(_underlyingToken);//var to inreact to contracts
        governanceToken = GovernanceToken(_governancetoken);
    }
    
    //Deposit fnction for  Investor can provide liquidity 
    
    function deposit(uint amount) external {
        if(checkpoints[msg.sender] == 0) {
            checkpoints[msg.sender] = block.number;
        } 
        _distributeRewards(msg.sender);
    }
    
    function _distributeRewards(address beneficiary) internal {
        uint checkpoint  = checkpoints[beneficiary];
        if(block.number - checkpoint > 0) {
            uint distbutionamount = balanceOf(beneficiary) * (block.number - checkpoint) *REWARD_PER_BLOCK ;  
            governanceToken.uint (beneficiary, distributionAmount );
            checkpoints[beneficiary] = block.number; 
        }
    }
}
