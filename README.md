Uniswap V3
Lint Tests Fuzz Testing Mythx npm version

This repository contains the core smart contracts for the Uniswap V3 Protocol. For higher level contracts, see the uniswap-v3-periphery repository.

Bug bounty
This repository is subject to the Uniswap V3 bug bounty program, per the terms defined here.

Local deployment
In order to deploy this code to a local testnet, you should install the npm package @uniswap/v3-core and import the factory bytecode located at @uniswap/v3-core/artifacts/contracts/UniswapV3Factory.sol/UniswapV3Factory.json. For example:

import {
  abi as FACTORY_ABI,
  bytecode as FACTORY_BYTECODE,
} from '@uniswap/v3-core/artifacts/contracts/UniswapV3Factory.sol/UniswapV3Factory.json'

// deploy the bytecode
This will ensure that you are testing against the same bytecode that is deployed to mainnet and public testnets, and all Uniswap code will correctly interoperate with your local deployment.

Using solidity interfaces
The Uniswap v3 interfaces are available for import into solidity smart contracts via the npm artifact @uniswap/v3-core, e.g.:

import '@uniswap/v3-core/contracts/interfaces/IUniswapV3Pool.sol';

contract MyContract {
  IUniswapV3Pool pool;

  function doSomethingWithPool() {
    // pool.swap(...);
  }
}
Licensing
The primary license for Uniswap V3 Core is the Business Source License 1.1 (BUSL-1.1), see LICENSE. However, some files are dual licensed under GPL-2.0-or-later:

All files in contracts/interfaces/ may also be licensed under GPL-2.0-or-later (as indicated in their SPDX headers), see contracts/interfaces/LICENSE
Several files in contracts/libraries/ may also be licensed under GPL-2.0-or-later (as indicated in their SPDX headers), see contracts/libraries/LICENSE
Other Exceptions
contracts/libraries/FullMath.sol is licensed under MIT (as indicated in its SPDX header), see contracts/libraries/LICENSE_MIT
All files in contracts/test remain unlicensed (as indicated in their SPDX headers).