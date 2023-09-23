// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
pragma solidity ^0.8.0;

contract UnderlyingToken is ERC20 {
constructor() ERC20('Lp Token', 'LTK') {}

function faucet (address to , uint amount) external {
    _mint(to , amount);
}
}
