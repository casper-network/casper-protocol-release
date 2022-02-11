# Changelog

All notable changes to this network protocol config will be documented in this file.  

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

[comment]: <> (Added:      new features)
[comment]: <> (Changed:    changes in existing functionality)
[comment]: <> (Deprecated: soon-to-be removed features)
[comment]: <> (Removed:    now removed features)
[comment]: <> (Fixed:      any bug fixes)
[comment]: <> (Security:   in case of vulnerabilities)


## 1.1.2 - 388
### casper-node 1.1.2-a2679a4f

### Changed
* chainspec.toml
  * protocol
    * version
    * hard_reset set to true
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
