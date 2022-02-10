# Changelog

All notable changes to this network protocol config will be documented in this file.  

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

[comment]: <> (Added:      new features)
[comment]: <> (Changed:    changes in existing functionality)
[comment]: <> (Deprecated: soon-to-be removed features)
[comment]: <> (Removed:    now removed features)
[comment]: <> (Fixed:      any bug fixes)
[comment]: <> (Security:   in case of vulnerabilities)


## 1.4.4 - 3435
### casper-node 1.4.4-6962edb3d-casper-mainnet

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
* config-example.toml
  * network
    * known_addresses

## 1.4.3 - 3111
### casper-node 1.4.3-a44bed1fd-casper-mainnet

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
  * wasm
    * max_stack_height from 65_536 to 188
    * host_function_costs
      * transfer_from_purse_to_account from 160_000 to 2_500_000_000
      * transfer_to_account from 24_000 to 2_500_000_000
* config-example.toml
  * network
    * known_addresses
  * contract_runtime
    * max_global_state_size
## Added
* chainspec.toml
  * core
    * max_runtime_call_stack_height

## 1.4.1 - 2600
### casper-node 1.4.1-c1f1c4df4-casper-mainnet

## Changed
* Summary
  * Many settings are for changing block speed from 65 seconds to 32 seconds.  
  * Deploys are half per block, but same throughput overall with better latency.
  * Native transfers increased to 0.1 CSPR to eliminate attack vector.
* chainspec.toml
  * protocol
    * version
    * activation_point
  * core
    * round_seigniorage_rate (Changed for faster rounds)
  * highway
    * minimum_round_exponent from 16 to 15
    * maximum_round_exponent from 18 to 17
  * deploys
    * block_max_deploy_count from 100 to 50
    * block_max_transfer_count from 2500 to 1250
  * wasm
    * host_function_costs
      * create_purse from 170_000 to 2_500_000_000
  * system_costs
    * wasmless_transfer_cost to 100_000_000
    * mint_costs
      * mint to 2_500_000_000
      * create to 2_500_000_000
      
## 1.3.4 - 2193
### casper-node 1.3.4-0d28d49

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
* config-example.toml
  * consensus
    * highway
      * shutdown_on_standstill to true

## 1.3.2 - 1605
### casper-node 1.3.2-e2027dbe9

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
* config-example.toml
  * consensus
    * highway
      * standstill_timeout from 60 to 30 min

## Added
* config-example.toml
  * consensus
    * highway
      * shutdown_on_standstill = false
  * 

## 1.2.1 - 1281
### casper-node 1.2.1-b7802f4

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
* config-example.toml
  * consensus
    * highway
      * standstill_timeout from 5 to 60min
  * network
    * known_addresses

## 1.2.0 - 694
### casper-node 1.2.0-58912c93

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point

## 1.1.2 - 574
### casper-node 1.1.2-a2679a4f

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
  * network
    * known_addresses
  * consensus
    * highway (large number of fields)

## 1.1.0 - 347
### casper-node 1.1.1-9583f902

### Added
* chainspec.toml
  * network
    * maximum_net_message_size
  * deploys
    * max_deploy_size

### Changed
* chainspec.toml
  * protocol
    * version
    * hard_reset set to true
    * activation_point
  * system_costs
    * auction_costs
      * add_bid set to 2_500_000_000
      * delegate set to 2_500_000_000
* config-example.toml
  * network
    * known_addresses updated

## 1.0.0 - 2021-03-31 15:00:00 UTC 
### casper-node 1.0.0-31d7de47

### Added
* Genesis accounts.toml, chainspec.toml, config-example.toml
