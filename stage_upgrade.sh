#!/usr/bin/env bash

set -e

# This script will stage the upgrade files for casper network from 1.5.3 to 1.5.6

if [ "$(whoami)" != "root" ]; then
  echo
  echo "Script must be run as root"
  echo "Do this with 'sudo $0'"
  echo
  exit 1
fi

if [[ -d "/etc/casper/1_5_6" ]]; then
   echo "Upgrade 1.5.6 already staged."
   exit 0
fi

# delete previously staged 1_5_5 to replace with current faked 1_5_5 to jump to 1_5_6
rm /etc/casper/1_5_5 || true
rm /var/lib/casper/bin/1_5_5 || true

CNL_VERSION=$(casper-node-launcher --version | cut -d' ' -f4)

# Format of the arguments to pull_casper_node_version.sh script changed to allow conf
# files for other networks with 0.3.3+.

if [[ ${CNL_VERSION:0:1} == "1" ]]; then
   echo "casper-node-launcher version 1.x.x, using node_util.py  syntax."
   sudo -u casper /etc/casper/node_util.py stage_protocols casper.conf
else
  if [ $CNL_VERSION == "0.3.2" ]; then
     echo "casper-node-launcher version 0.3.2, using old syntax."
     sudo -u casper /etc/casper/pull_casper_node_version.sh 1_5_5 casper
     sudo -u casper /etc/casper/pull_casper_node_version.sh 1_5_6 casper
  else
     echo "casper-node-launcher version 0.3.3+, using conf syntax."
     sudo -u casper /etc/casper/pull_casper_node_version.sh casper.conf 1_5_5
     sudo -u casper /etc/casper/pull_casper_node_version.sh casper.conf 1_5_6
  fi
  sudo -u casper /etc/casper/config_from_example.sh 1_5_5
  sudo -u casper /etc/casper/config_from_example.sh 1_5_6
fi
echo "Upgrade 1_5_6 staged."


exit 0