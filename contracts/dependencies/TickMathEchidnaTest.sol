/*

 ██████  ██████   ██████  ██   ██ ██████   ██████   ██████  ██   ██    ██████  ███████ ██    ██
██      ██    ██ ██    ██ ██  ██  ██   ██ ██    ██ ██    ██ ██  ██     ██   ██ ██      ██    ██
██      ██    ██ ██    ██ █████   ██████  ██    ██ ██    ██ █████      ██   ██ █████   ██    ██
██      ██    ██ ██    ██ ██  ██  ██   ██ ██    ██ ██    ██ ██  ██     ██   ██ ██       ██  ██
 ██████  ██████   ██████  ██   ██ ██████   ██████   ██████  ██   ██ ██ ██████  ███████   ████

Find any smart contract, and build your project faster: https://www.cookbook.dev
Twitter: https://twitter.com/cookbook_dev
Discord: https://discord.gg/WzsfPcfHrk

Find this contract on Cookbook: https://www.cookbook.dev/contracts/Uniswap-V4?utm=code
*/

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {TickMath} from "./TickMath.sol";

contract TickMathEchidnaTest {
    // uniqueness and increasing order
    function checkGetSqrtRatioAtTickInvariants(int24 tick) external pure {
        uint160 ratio = TickMath.getSqrtRatioAtTick(tick);
        assert(TickMath.getSqrtRatioAtTick(tick - 1) < ratio && ratio < TickMath.getSqrtRatioAtTick(tick + 1));
        assert(ratio >= TickMath.MIN_SQRT_RATIO);
        assert(ratio <= TickMath.MAX_SQRT_RATIO);
    }

    // the ratio is always between the returned tick and the returned tick+1
    function checkGetTickAtSqrtRatioInvariants(uint160 ratio) external pure {
        int24 tick = TickMath.getTickAtSqrtRatio(ratio);
        assert(ratio >= TickMath.getSqrtRatioAtTick(tick) && ratio < TickMath.getSqrtRatioAtTick(tick + 1));
        assert(tick >= TickMath.MIN_TICK);
        assert(tick < TickMath.MAX_TICK);
    }
}
