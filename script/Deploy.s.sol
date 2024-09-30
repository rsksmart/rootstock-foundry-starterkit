// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/ERC20Token.sol";

contract DeployERC20Token is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Deployment with initial supply of 1,000 tokens
        new ERC20Token(1000 * 10 ** 18);
        vm.stopBroadcast();
    }
}
