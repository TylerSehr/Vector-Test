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

import {BitMath} from "./BitMath.sol";

contract BitMathEchidnaTest {
    function mostSignificantBitInvariant(uint256 input) external pure {
        unchecked {
            uint8 msb = BitMath.mostSignificantBit(input);
            assert(input >= (uint256(2) ** msb));
            assert(msb == 255 || input < uint256(2) ** (msb + 1));
        }
    }

    function leastSignificantBitInvariant(uint256 input) external pure {
        unchecked {
            uint8 lsb = BitMath.leastSignificantBit(input);
            assert(input & (uint256(2) ** lsb) != 0);
            assert(input & (uint256(2) ** lsb - 1) == 0);
        }
    }
}
