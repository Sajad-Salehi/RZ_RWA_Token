// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import { FunctionsClient } from "@chainlink/contracts/src/v0.8/functions/dev/v1_0_0/FunctionsClient.sol";
import { FunctionsRequest } from "@chainlink/contracts/src/v0.8/functions/dev/v1_0_0/libraries/FunctionsRequest.sol";

abstract contract FunctionsHandler is FunctionsClient {
    using FunctionsRequest for FunctionsRequest.Request;

    error UnexpectedRequestID(bytes32 requestId);

    uint64 internal i_subId;
    bytes32 internal s_donID;
    uint64 internal s_secretVersion;
    uint8 internal s_secretSlot;
    string internal s_mintSource;
    string internal s_redeemSource;
    uint32 internal constant GAS_LIMIT = 300_000;

    constructor(address functionsRouter) FunctionsClient(functionsRouter) {}

    function _buildRequest(string memory source, string[] memory args)
        internal
        view
        returns (FunctionsRequest.Request memory req)
    {
        req.initializeRequestForInlineJavaScript(source);
        req.addDONHostedSecrets(s_secretSlot, s_secretVersion);
        if (args.length > 0) req.setArgs(args);
    }
}