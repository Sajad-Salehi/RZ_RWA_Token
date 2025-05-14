// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import "forge-std/console.sol";
import {Test} from "forge-std/Test.sol";
import {OraclePriceFeed} from "../../src/oracle/OraclePriceFeed.sol";

contract OraclePriceFeedTest is Test {
    OraclePriceFeed public oracle;

    uint256 precision;
    address feed;

    function setUp() public {
        precision = 1e10;
        feed = 0xc59E3633BAAC79493d908e63626716e204A45EdF;
        oracle = new OraclePriceFeed();
    }

    function testGetPrice() public view {
        uint256 price = oracle.getPrice(feed, precision);
        assertGt(price, 0, "Price should be greater than 0");
        console.log("Price: %s", price);
    }
}