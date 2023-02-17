# Changelog

All notable changes to this network protocol config will be documented in this file.  

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

[comment]: <> (Added:      new features)
[comment]: <> (Changed:    changes in existing functionality)
[comment]: <> (Deprecated: soon-to-be removed features)
[comment]: <> (Removed:    now removed features)
[comment]: <> (Fixed:      any bug fixes)
[comment]: <> (Security:   in case of vulnerabilities)

## 1.4.13 - 8154
### casper-node 1.4.13-c8db6a737-casper-mainnet

## Added
* chainspec.toml
  * wasm.opcode.control_flow
    * block
    * loop
    * if
    * else
    * end
    * br
    * br_if
    * return
    * select
    * call
    * call_indirect
    * drop

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
  * wasm.opcode_costs
    * control_flow
  * system_costs.auction_costs
    * withdraw_bid
    * undelegate

## Removed
* chainspec.toml
  * wasm.opcode_costs
    * control_flow


## 1.4.10 - 7098
### casper-node 1.4.8-b94c4f79a-casper-mainnet

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
  * wasm.opcode_costs
    * control_flow
* global_state.toml
  * provided to fix cabal holding network hostage

## 1.4.8 - 5948
### casper-node 1.4.8-b94c4f79a-casper-mainnet

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point


## 1.4.7 - 5828
### casper-node 1.4.7-298dfaa3b-casper-mainnet

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point


## 1.4.6 - 4785
### casper-node 1.4.6-72b698e89-casper-mainnet

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point

## 1.4.5 - 4102
### casper-node 1.4.5-a7f6a648d-casper-mainnet

## Added
* chainspec.toml
  * core
    * max_stored_value_size
    * minimum_delegation_amount
  * deploys
    * block_max_approval_count

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
    
## 1.4.4 - 3264
### casper-node 1.4.4-6962edb3d-casper-mainnet

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point


## 1.4.3 - 2940
### casper-node 1.4.3-a44bed1fd-casper-mainnet

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
  * wasm
    * max_stack_height
    

## 1.4.2 - 2736
### casper-node 1.4.2-930a43774-casper-mainnet

## Added
* chainspec.toml
  * core
    * max_runtime_call_stack_height

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
  * wasm
    * host_function_costs
      * transfer_from_purse_to_account
      * transfer_to_account
* config-example.toml
  * contract_runtime
    * max_global_state_size



## 1.4.1 - 2400
### casper-node 1.4.1-dd260c86a-casper-mainnet

## Added
* global_state.toml
* chainspec.toml
  * core
    * max_associated_keys
* config-example.toml
  * consensus
    * highway
      * log_synchronizer_interval
      * max_request_batch_size
  * network
    * estimator_weights
  * contract_runtime
    * enable_manual_sync

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
  * core
    * round_seigniorage_rate
  * highway
    * minimum_round_exponent
    * maximum_round_exponent
  * deploys
    * block_max_deploy_count
    * block_max_transfer_count
  * wasm
    * host_function_costs
      * create_purse
  * system_costs
    * wasmless_transfer_cost
    * mint_costs
      * mint
      * create
* config-example.toml
  * consensus
    * highway
      * pending_vertex_timeout from 15min to 30min
      * standstill_timeout from 15min to 30min

## Removed
* config-example.toml
  * consensus
    * highway
      * shutdown_on_standstill

## 1.3.4 - 2005
### casper-node 1.3.4-0d28d49

### Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
* config-example.toml
  * consensus
    * highway
      * pending_vertex_timeout from 30min to 15min
      * standstill_timeout from 30min to 15min


## 1.3.2 - 1418
### casper-node 1.3.2-e2027dbe9

### Changed
* chainspec.toml
  * protocol
    * version
    * activation_point


## 1.3.1 - 1346
### casper-node 1.3.1-10ed44340

## Added
* config-example.toml
  * consensus
    * highway
      * shutdown_on_standstill = true
  * network
    * max_outgoing_byte_rate_non_validators
    * max_incoming_message_rate_non_validators
  * storage
    * enable_mem_deduplication
    * mem_pool_prune_interval
  * linear_chain_sync
    * sync_timeout

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
* config-example.toml
  * consensus
    * highway
      * standstill_timeout from 5min to 30min
  * event_stream_server
    * qps_limit changed to max_concurrent_subscribers


## 1.2.1 - 1143
### casper-node 1.2.1-b7802f4

### Changed
* chainspec.toml
  * protocol
    * version
    * activation_point


## 1.2.0 - 490
### casper-node 1.2.0-58912c93

## Added
* config-example.toml
  * consensus
    * highway
      * standstill_timeout
      * log_participation_interval
      * log_unit_sizes
      * max_requests_for_vertex
      * round_success_meter
        * num_rounds_to_consider
        * num_rounds_slowdown
        * num_rounds_speedup
        * acceleration_parameter
        * acceleration_ftt

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
    

## 1.1.2 - 388
### casper-node 1.1.2-a2679a4f

### Changed
* chainspec.toml
  * protocol
    * version
    * activation_point


## 1.1.0 - 166
### casper-node 1.1.1-874c2db4

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


## 1.0.0 - 2021-04-08T17:00:00Z
### casper-node 1.0.0-31d7de47

### Added
* Genesis accounts.toml, chainspec.toml, config-example.toml
