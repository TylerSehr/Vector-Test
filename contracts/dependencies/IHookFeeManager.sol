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

// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.20;

import {PoolKey} from "./PoolKey.sol";

/// @notice The interface for setting a fee on swap or fee on withdraw to the hook
/// @dev This callback is only made if the Fee.HOOK_SWAP_FEE_FLAG or Fee.HOOK_WITHDRAW_FEE_FLAG in set in the pool's key.fee.
interface IHookFeeManager {
    /// @notice Sets the fee a hook can take at swap.
    /// @param key The pool key
    /// @return The fee as an integer denominator for 1 to 0 swaps (upper bits set) or 0 to 1 swaps (lower bits set).
    function getHookSwapFee(PoolKey calldata key) external view returns (uint8);

    /// @notice Sets the fee a hook can take at withdraw.
    /// @param key The pool key
    /// @return The fee as an integer denominator for amount1 (upper bits set) or amount0 (lower bits set).
    function getHookWithdrawFee(PoolKey calldata key) external view returns (uint8);
}
