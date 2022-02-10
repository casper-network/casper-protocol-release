# Changelog

All notable changes to this network protocol config will be documented in this file.  

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

[comment]: <> (Added:      new features)
[comment]: <> (Changed:    changes in existing functionality)
[comment]: <> (Deprecated: soon-to-be removed features)
[comment]: <> (Removed:    now removed features)
[comment]: <> (Fixed:      any bug fixes)
[comment]: <> (Security:   in case of vulnerabilities)


## [1.1.0] - 347 (1.1.1-9583f902)

### Added
* chainspec.toml
  * network.maximum_net_message_size
  * deploys.max_deploy_size

### Changed
* chainspec.toml
  * protocol.hard_reset set to true
  * system_costs.auction_costs.add_bid set to 2_500_000_000
  * system_costs.auction_costs.delegate set to 2_500_000_000
* config-example.toml
  * network.known_addresses updated

## [1.0.0] - 2021-03-31 15:00:00 UTC (1.0.0-31d7de47)

### Added
* Genesis accounts.toml, chainspec.toml, config-example.toml
