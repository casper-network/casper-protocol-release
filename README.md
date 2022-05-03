# casper-protocol-release

A protocol release for a casper network is a combination of a casper-node binary release and network
configuration. The current scripts in casper-node-launcher packages expect these to be packaged as 
.tar.gz files.

In the file system a protocol version is represented with underscores `_` instead of periods `.`.

For example: protocol version `1.0.0` will use `1_0_0` for files paths. 

# Network branches

Branches on the repo will be associated with networks the protocol are targeted towards.  This has a 
disadvantage of requiring merging of CI changes to `main` into all network branches.

Public networks: `casper` and `casper-test`

# Tagging for release

Tags for a given branch should be prefixed by the branch name. 

For example: 
 - Tags on the `casper` branch should look like `casper-1.0.0` for protocol `1.0.0`.
 - Tags on the `casper-test` branch should look like `casper-test-1.1.2` for protocol `1.1.2`.

# Expected hosting format

When a node is setup, the `casper-node-launcher` package is installed.  This contains configuration files for
`casper` and `casper-test` networks.  They are installed in `/etc/casper/network_configs`.  

Information about these files can be found in the [casper-node-launcer repo](https://github.com/casper-network/casper-node-launcher/tree/main/resources/maintainer_scripts/network_configs).

The two values of interest are `SOURCE_URL` and `NETWORK_NAME`.  This is the url of the web server hosting files and 
the path to that network specific files.  For example, MainNet is `genesis.casperlabs.io/casper`.  

Within this location, there will be a `protocol_versions` file.  This is plain text with one protocol version per line
with underscore format.  Such as:

```
1_0_0
1_1_2
1_2_1
1_3_0
```

An entry should exist for every protocol version that is needed to currently sync to the network.  For each entry, 
a directory should exist with the same underscore protocol name.  This will hold `bin.tar.gz` and `config.tar.gz`.  As
more host systems are supported, we may expand to include `bin_rpm.tar.gz` and others.

While not present on casper or casper-test hosting, because these network configs are included with `casper-node-launcher`,
a different network should offer the conf file for that network in the same location as `protocol_versions`.

The `integration-test` network has an `integration-test.conf` hosted in the root of its staging directory.  This would be 
pulled down directly into the `network_configs` directory of the node, so it could be used with commands.

```
cd /etc/casper/network_configs
sudo -u casper curl -JLO [url]/[network_name]/[network name].conf
```

Loading all protocols for a given network is simply `sudo -u casper /etc/casper/node_util.py stage_protocol [conf filename]`.

To finish off our example, we will list a full directory tree of our `exampled-test` network.

```
example-test/
  example-test.conf
  protocol_versions
  1_0_0/
     bin.tar.gz
     config.tar.gz
  1_1_2/
     bin.tar.gz
     config.tar.gz
  1_2_1/
     bin.tar.gz
     config.tar.gz
  1_3_0/
     bin.tar.gz
     config.tar.gz
```

# config.tar.gz

This group of files should be installed on the server in `/etc/casper/[protocol_version]/`.  This is done
as part of `/etc/casper/node_util.py stage_protocols` distributed with `casper-node-launcher` package.

This is a system agnostic configuration files for a protocol release.  The starting protocol version
of 1.0.0 requires `accounts.toml` to initialize accounts at genesis.  This file should not exist for any
version past the genesis 1.0.0 protocol.

`chainspec.toml` is the configuration for the network.  This must be the same for all nodes on the network
to continue with consensus.  Activation point for genesis is a timestamp, otherwise it is an Era ID.  Protocol version
must match the version used for staging directory.

`config-example.toml` is the default configuration with a location to drop in the node's IP address to
create a `config.toml` file on the server. This is done automatically with the `node_util.py` 
script distributed with `casper-node-launcher` packages.  The big change needed for this with a new network is
the known_address list which should have some or all of the genesis node IPs.

Other files may be included with `config.tar.gz` as needed for upgrade or additional functionality of the system.
For example: `global_state.toml` can be used at an upgrade to modify something in global state.

## Manually creating config.tar.gz

While `config.tar.gz` is built via tagging on this repo in CI, they could be build manually for another network. 
This should be archived without a directory structure.

```
mkdir config
cp [path of]/config.example.toml ./config
cp [path of]/chainspec.toml ./config
cd config
tar -czvf ../config.tar.gz .
```

This file would be hosted in the `[url][network_name][underscore protocol version]` directory of the staging location,
where the protocol version matches that defined in the `chainspec.toml` file.

# bin.tar.gz

The `bin.tar.gz` package holds a `casper-node` binary compiled for Ubuntu 18.04.

In addition to the appropriate `casper-node` binary a `README.md` file is included which identifies both 
the platform targeted, and the github source for compilation. 

Note: Because of similarities to binary versions and protocol versions with MainNet `casper` network, it
should be noted that the protocol version has no correlation to the `casper-node` binary version. If a new
network was created, the `1.0.0` protocol should most likely use the latest viable binary version.

This file is created as part of a casper-node release and generally can be pulled directly from there for hosting.

For example: https://github.com/casper-network/casper-node/releases/tag/v1.4.5 holds `bin.tar.gz` as a release artifact.
This would be pulled down and hosted for a network protocol.

To manually package this you could minimally:

```
mkdir bin
cp [path of]/casper-node ./bin
cd bin
tar -czvf ../bin.tar.gz .
```

Where casper-node is compiled binary of casper-node targeting 18.04 Ubuntu.
