// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// import '@openzeppelin/contracts/ERC20/ERC20.sol';

contract LpToken is ERC20 {
constructor() ERC20('Lp Token', 'LTK'){}

}