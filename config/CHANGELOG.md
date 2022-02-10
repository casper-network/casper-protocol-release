# Changelog

All notable changes to this network protocol config will be documented in this file.  

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

[comment]: <> (Added:      new features)
[comment]: <> (Changed:    changes in existing functionality)
[comment]: <> (Deprecated: soon-to-be removed features)
[comment]: <> (Removed:    now removed features)
[comment]: <> (Fixed:      any bug fixes)
[comment]: <> (Security:   in case of vulnerabilities)


## 1.2.1 - 1281
### casper-node 1.2.1-b7802f4

## Changed
* chainspec.toml
  * protocol.version
  * protocol.activation_point
* config-example.toml
  * consensus.highway.standstill_timeout from 5 to 60min
  * network.known_addresses

## 1.2.0 - 694
### casper-node 1.2.0-58912c93

## Changed
* chainspec.toml
  * protocol.version
  * protocol.activation_point

## 1.1.2 - 574
### casper-node 1.1.2-a2679a4f

## Changed
* chainspec.toml
  * protocol.version
  * protocol.activation_point
  * network.known_addresses
  * consensus.highway (large number of fields)

## 1.1.0 - 347
### casper-node 1.1.1-9583f902

### Added
* chainspec.toml
  * network.maximum_net_message_size
  * deploys.max_deploy_size

### Changed
* chainspec.toml
  * protocol.version
  * protocol.hard_reset set to true
  * protocol.activation_point
  * system_costs.auction_costs.add_bid set to 2_500_000_000
  * system_costs.auction_costs.delegate set to 2_500_000_000
* config-example.toml
  * network.known_addresses updated

## 1.0.0 - 2021-03-31 15:00:00 UTC 
### casper-node 1.0.0-31d7de47

### Added
* Genesis accounts.toml, chainspec.toml, config-example.toml
