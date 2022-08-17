// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;


import {RoyaltyToken} from "src//RoyaltyToken.sol";

import "forge-std/Test.sol";

contract RoyaltyTokenTest is Test {
    RoyaltyToken public token;
  uint256 public royaltyFeePercentage = 2;
  uint256 public initialSupply = 10 ** 4;

  function setUp() public {
    token = new RoyaltyToken("RoyaltyToken", "ROYT", 18, royaltyFeePercentage, initialSupply);
  }

  function testTransfer() public {
    address hilla = address(1);
    address kip = address(2);

    token.transfer(hilla, 1000);

    assertEq(token.balanceOf(hilla), 980);
    assertEq(token.balanceOf(address(this)), 9020);

    hoax(hilla);
    token.transfer(kip, 100);

    assertEq(token.balanceOf(hilla), 880);
    assertEq(token.balanceOf(kip), 98);
    assertEq(token.balanceOf(address(this)), 9022);
  }
}