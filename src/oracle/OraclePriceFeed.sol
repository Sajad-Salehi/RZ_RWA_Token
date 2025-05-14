// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import { OracleLib } from "./OracleLib.sol";

contract OraclePriceFeed {
    using OracleLib for AggregatorV3Interface;

    function getPrice(address feed, uint256 precision) public view returns (uint256) {
        (, int256 price,,,) = AggregatorV3Interface(feed).staleCheckLatestRoundData();
        return uint256(price) * precision;
    }
}