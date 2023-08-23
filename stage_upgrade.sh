#!/usr/bin/env bash

set -e

# This script will stage the upgrade files for casper network from 1.4.15 to 1.5.2

if [ "$(whoami)" != "root" ]; then
  echo
  echo "Script must be run as root"
  echo "Do this with 'sudo $0'"
  echo
  exit 1
fi

if [[ -d "/etc/casper/1_5_2" ]]; then
   echo "Upgrade 1.5.2 already staged."
   exit 0
fi

CNL_VERSION=$(casper-node-launcher --version | cut -d' ' -f4)

# Format of the arguments to pull_casper_node_version.sh script changed to allow conf
# files for other networks with 0.3.3+.

if [ $CNL_VERSION == "0.3.2" ]; then
   echo "casper-node-launcher version 0.3.2, using old syntax."
   sudo -u casper /etc/casper/pull_casper_node_version.sh 1_5_2 casper
else
   echo "casper-node-launcher version 0.3.3+, using conf syntax."
   sudo -u casper /etc/casper/pull_casper_node_version.sh casper.conf 1_5_2
fi

sudo -u casper /etc/casper/config_from_example.sh 1_5_2
echo "Upgrade 1_5_2 staged."

if [[ "18.04" == $(lsb_release -sr) ]]; then
  echo
  echo "WARNING - The current protocol upgrade is staged, however you have issues that need fixed prior the the next upgrade."
  echo
  echo "This server is running on Ubuntu 18.04, which reached end of life on May 31, 2023."
  echo "It is recommended that you load a new node with 20.04 or 22.04."
  echo "Future protocol upgrades may require 20.04 as the minimum supported version."
  echo
  echo "Instructions for loading a node can be found at https://docs.casper.network/operators/setup/"
  echo "DO NOT run multiple nodes with the same key.  If you are an active validator, you should follow"
  echo "Method Two of this guide: https://docs.casper.network/operators/maintenance/moving-node/"
  echo "to bring up a new node and migrate over with minimal downtime."
  echo
  echo "Additional communication on syncing a new node using less disk space will be released after 1.5.2 upgrade is active on MainNet."
  exit 1
fi

if [[ ${CNL_VERSION:0:1} == "0" ]]; then
  echo
  echo "WARNING - The current protocol upgrade is staged, however you have issues that need fixed prior the the next upgrade."
  echo
  echo "This is a very old version of casper-node-launcher and will not be supported after this protocol upgrade."
  echo "Please make sure you are setup to pull software from https://repo.casperrlabs.io and install the latest version."
  echo
  exit 1
fi

exit 0