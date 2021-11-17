# casper-protocol-release

A protocol release for a casper network is a combination of a casper-node binary release and network
configuration. The current scripts in casper-node-launcher packages expect these to be packaged as 
.tar.gz files.

In the file system a protocol version is represented with underscores `_` instead of periods `.`.

For example: protocol version `1.0.0` will use `1_0_0` for files paths. 

# config.tar.gz

This group of files should be installed on the server in `/etc/casper/<protocol_version>/`.  This is done
as part of `pull_casper_node_version.sh` distributed with `casper-node-launcher` packages.

This is a system agnostic configuration files for a protocol release.  The starting protocol version
of 1.0.0 requires `accounts.toml` to initialize accounts at genesis.  This file should not exist for any
version past the genesis 1.0.0 protocol.

`chainspec.toml` is the configuration for the network.  This must be the same for all nodes on the network
to continue with consensus.

`config-example.toml` is the default configuration with a location to drop in the node's IP address to
create a `config.toml` file on the server. This is done automatically with the `config_from_example.sh` 
script distributed with `casper-node-launcher` packages.

Other files may be included with `config.tar.gz` as needed for upgrade or additional functionality of the system.

# bin.tar.gz - bin_rpm.tar.gz

The `bin.tar.gz` package holds a `casper-node` binary compiled for Ubuntu 18.04/20.04.

The `bin_rpm.tar.gz` package holds a `casper-node` binary compiled for CentOS 8 / RHEL 8.

In addition to the appropriate `casper-node` binary a `README.md` file is included which identifies both 
the platform targeted, and the github source for compilation. 

Note: Because of similarities to binary versions and protocol versions with MainNet `casper` network, it
should be noted that the protocol version has no correlation to the `casper-node` binary version. If a new
network was created, the `1.0.0` protocol should most likely use the latest viable binary version.

# Network branches

Branches on the repo will be associated with networks the protocol are targeted towards.  This has a 
disadvantage of requiring merging of CI changes to `main` into all network branches.

Public networks: `casper` and `casper-test`

# Tagging for release

Tags for a given branch should be prefixed by the branch name. 

For example: 
 - Tags on the `casper` branch should look like `casper-1.0.0` for protocol `1.0.0`.
 - Tags on the `casper-test` branch should look like `casper-test-1.1.2` for protocol `1.1.2`.
