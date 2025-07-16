// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Erc20Token.sol";

contract ERC20TokenTest is Test {
    ERC20Token token;

    address deployer = address(1);
    address user = address(2);

    function setUp() public {
        // Simulate deployment made by the "deployer" account
        vm.startPrank(deployer);
        token = new ERC20Token(1000 * 10 ** 18);
        vm.stopPrank();
    }

    function testInitialSupply() public view {
        // Verify that the deployer has the initial supply
        assertEq(token.balanceOf(deployer), 1000 * 10 ** 18);
    }

    function testTransfer() public {
        // Simulate a transfer from the deployer to the user
        vm.startPrank(deployer);
        token.transfer(user, 100 * 10 ** 18);
        vm.stopPrank();
        // Verify that the user received the tokens
        assertEq(token.balanceOf(user), 100 * 10 ** 18);
    }
}
