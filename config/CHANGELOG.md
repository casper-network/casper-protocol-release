# Changelog

All notable changes to this network protocol config will be documented in this file.  

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

[comment]: <> (Added:      new features)
[comment]: <> (Changed:    changes in existing functionality)
[comment]: <> (Deprecated: soon-to-be removed features)
[comment]: <> (Removed:    now removed features)
[comment]: <> (Fixed:      any bug fixes)
[comment]: <> (Security:   in case of vulnerabilities)

## 1.5.3 - 10826
### casper-node 1.5.3-7aa53e8

## Removed
* config-example.toml
  * block_synchronizer
    * stall_limit

## Added
* chainspec.toml
  * deploys
    * max_timestamp_leeway
* block_validator
  * max_completed_entries
* deploy_acceptor
  * timestamp_leeway

## Changed
* Reformating of multiple time based values
* chainspec.toml
  * protocol
    * version
    * activation_point

## 1.5.2 - 9904
### casper-node 1.5.2-86b7013

## Added 
* config-example.toml
  * core
    * minimum_block_time
    * finality_threshold_fraction
    * start_protocol_version_with_strict_finality_signatures_required
    * legacy_required_finality
    * vesting_schedule_period
    * strict_argument_checking
    * simultaneous_peer_requests
    * consensus_protocol
    * max_delegators_per_validator
  * highway
    * maximum_round_length
  * wasm.host_function_costs
    * random_bytes
  * system_costs.auction_costs
    * redelegate
  * system_costs.mint_costs
    * mint_into_existing_purse
  * node
    * shutdown_for_upgrade_timeout
    * upgrade_timeout
* config-example.toml
  * node
    * sync_to_genesis
    * idle_tolerance
    * max_attempts
    * control_logic_default_delay
    * force_resync
  * consensus
    * max_execution_delay
    * zug
      * sync_state_interval
      * log_participation_interval
      * proposal_timeout
      * proposal_grace_period
      * proposal_timeout_inertia
      * clock_tolerance
  * network
    * min_peers_for_initialization
    * handshake_timeout
    * max_incoming_peer_connections
    * max_in_flight_demands
    * tarpit_version_threshold
    * tarpit_duration
    * tarpit_chance
    * blocklist_retain_duration
    * estimator_weights
      * gossip
      * finality_signatures
      * deploy_responses
      * block_requests
      * block_responses
      * trie_requests
      * trie_responses
  * rpc_server
    * enable_server
    * max_body_bytes
    * cors_origin
  * speculative_exec_server
    * enable_server
    * address
    * qps_limit
    * max_body_bytes
    * cors_origin
  * rest_server
    * enable_server
    * cors_origin
  * event_stream_server
    * enable_server
    * cors_origin
  * gossip
    * validate_and_store_timeout
  * block_accumulator
    * attempt_execution_threshold
    * dead_air_interval
    * purge_interval
  * block_synchronizer
    * max_parallel_trie_fetches
    * peer_refresh_interval
    * need_next_interval
    * disconnect_dishonest_peers_interval
    * latch_reset_interval
    * stall_limit
  * deploy_buffer
    * expiry_check_interval
  * diagnostics_ports
    * enabled
    * socket_path
    * socket_umask
  * upgrade_watcher
    * upgrade_check_interval

## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
  * network
    * maximum_net_message_size
  * core
    * prune_batch_size
  * wasm
    * max_stack_height
  * wasm.host_function_costs
    * call_versioned_contract
* config-example.toml
  * storage
    * mem_pool_prune_interval
  * fetcher
    * get_from_peer_timeout

## Removed
* chainspec.toml
  * core
    * max_stored_value_size
  * highway
    * finality_threshold_fraction
    * minimum_round_exponent
    * maximum_round_exponent
* config-example.toml
  * consensus.highway
    * standstill_timeout
    * max_execution_delay
  * deploy_acceptor
  * linear_chain_sync
  * block_proposer


## 1.4.15 - 9015
### casper-node 1.4.15-039d438f2-casper-mainnet

## Added
* chainspec.toml
  * core
    * prune_batch_size
  
## Changed
* chainspec.toml
  * protocol
    * version
    * activation_point
  * wasm
    * max_stack_height
    * opcode_costs.control_flow
      * call
      * call_indirect

## Removed
* chainspec.toml
  * wasm.opcode_costs
    * regular

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

# 1.4.5 - 4102
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


# 1.4.3 - 2940
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
