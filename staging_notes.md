# Casper 2.0.0 upgrade

## Activation Point

2.0.0 upgrade will activate at the start of Era: 17889

This is expected around:
2025-05-06 11:43 UTC
2025-05-06 07:43 EST
2025-05-06 04:43 PST
2025-05-06 19:43 HK
2025-05-06 12:43 CET

Validating nodes participating in this upgrade need staged prior to this point.

## Staging procedure

### New debian repo

If you have not setup your server to pull from the new debian repo (repo.casper.network), please follow instructions
at https://repo.casper.network to point there.  

### casper-sidecar

The `RPC` interface on port 7777 has been removed from the `casper-node` and moved to the `casper-sidecar` process.
The `casper-sidecar` and `2.0.0` compatible `casper-client` should be installed with:

```bash
sudo apt install casper-client casper-sidecar
```

The `casper-sidecar` will run alongside the `casper-node` to provide RPC services. It will wait until the 2.0.0 upgrade
occurs and then replace the RPC service on port 7777.

### Staging casper-node upgrade

To stage the network protocol upgrade, run:

```bash
sudo -u casper /etc/casper/node_util.py stage_protocols casper.conf
```

### Verification of staging

Run the watch command:

```bash
/etc/casper/node_util.py watch
```

In the `Next Upgrade` section you should see the 2_0_0 protocol with Era 17889

## Advanced staging

Above is the minimum needed to stage a successful upgrade for 2_0_0 protocol release. This addition section provides notes
and changes that may be required for a node operator, depending on use cases.

### Modifying config.toml

#### known_addresses
Some optional changes can be made to `config.toml`.  In this version, the `known_addresses` have been drastically reduced.
You may wish to take some on your peers and include them as known_addresses. Be careful to include port with ip address (typically 35000).
Having a varied collection of known_addresses that operators build increases the reliability of the network.

#### allow_request_get_all_values

If you wish to query large auction based data on the node, you must enable a flag for the new `binary_port`. This is disabled
by default, as queries can be large and consume resources on the node.

```toml
# Flag that enables the `AllValues` get request. Disabled by default, because it can potentially be abused to retrieve huge amounts of data and clog the node.
allow_request_get_all_values = true
```

#### sync_handling

The default for `sync_handling` is `ttl`, which is recommended for validators. If you wish to create a full history
sync to genesis node, this will continue to take more time as the network grows. Contact Casper association for a link
to a DB archive which will prepopulate much of this historical data.

There are two main reasons we recommend a validator run as `ttl`:

 1 - LMDB is a memory backed storage and minimizing the DB footprint will improve performance.
 2 - If your node falls behind, with a `genesis` type sync, the node MUST complete historical sync prior to moving 
 from `KeepUp` to `Validate` mode. Depending on the duration of your outage, this could be some time. Backward sync
is a background process and de-prioritized compared to running the network.

#### replace.toml

If you have modifications to config.toml that you wish to perform, a `replace.toml` file can be created to assist with this. 
This file can be used during staging to automate the replace when a `config.toml` file is made from `config-example.toml` during staging.

It should be a minimal version of `config.toml` with only files you wish to replace. And example to change `allow_request_get_all_values`
is below:

```toml
[binary_port_server]
allow_request_get_all_values = true
```

I prefer to keep `replace.toml` (filename is not important) in `/etc/casper/` with my other config files.

To replace when staging protocol upgrades:
```bash
sudo -u casper /etc/casper/node_util.py stage_protocols casper.conf --replace /etc/casper/replace.toml 
```

If you have already staged and wish to change `config.toml` or just test the replacement, you can regenerate with:
```bash
sudo -u casper /etc/casper/node_util.py config_from_example 2_0_0 --replace /etc/casper/replace.toml
```
The output will indicate that since you have a `/etc/casper/2_0_0/config.toml`, `/ect/casper/2_0_0/config.toml.new` was created.

### Testing config.toml

If you make any changes to `config.toml` for the upcoming release, it is good to test them. If your node attempts to 
automatically upgrade, but has a parsing error with the config file, it will refuse to start. We have a verification of
parsing built into the node. This doesn't assure that values are correct, but only the node can parse the `config.toml`.

To check this, you would use the same binary version as the release and a special run command:

`/var/lib/casper/bin/2_0_0/casper-node validate-config /etc/casper/2_0_0/config.toml`

Example output:

```bash
$/var/lib/casper/bin/2_0_0/casper-node validate-config /etc/casper/2_0_0/config.toml
{"timestamp":"2025-04-28T13:30:42.694327Z","level":"INFO","fields":{"message":"config file is valid","build_version":"2.0.0-a7e4ff1","config_file":"/etc/casper/2_0_0/config.toml"},"target":"casper_node::cli"}
{"timestamp":"2025-04-28T13:30:42.696457Z","level":"INFO","fields":{"message":"exiting casper-node","exit_code":"0"},"target":"casper_node"}
```

Example of known_addresses with missing quotes for an entry:

```bash
$ ./casper-node validate-config ../config/config-example.toml 
2025-04-28T13:55:54.225122Z ERROR [casper_node::cli cli.rs:262] config file is not valid; build_version=2.0.0-a7e4ff1; config_file="/etc/casper/2_0_0/config.toml"
Error: TOML parse error at line 194, column 61
    |
194 | known_addresses = ['3.225.137.28:35000','3.231.187.43:35000]
    |                                                             ^
invalid literal string
```

Example of a field I "accidentally" added to the config that doesn't belong:

```bash
$ ./casper-node validate-config ../config/config-example.toml 
2025-04-28T13:57:17.270427Z ERROR [casper_node::cli cli.rs:262] config file is not valid; build_version=2.0.0-a7e4ff1; config_file="../config/config-example.toml"
Error: unknown field `field_that_should_not_be_here`, expected one of `bind_address`, `public_address`, `known_addresses`, `min_peers_for_initialization`, `gossip_interval`, `initial_gossip_delay`, `max_addr_pending_time`, `handshake_timeout`, `max_incoming_peer_connections`, `max_outgoing_byte_rate_non_validators`, `max_incoming_message_rate_non_validators`, `estimator_weights`, `tarpit_version_threshold`, `tarpit_duration`, `tarpit_chance`, `max_in_flight_demands`, `blocklist_retain_min_duration`, `blocklist_retain_max_duration`, `identity`
in `network`
```
