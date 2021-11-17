#!/usr/bin/env bash

# This script will config.tar.gz

set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null 2>&1 && pwd)"
CONFIG_DIR="$ROOT_DIR/config"

cd "$CONFIG_DIR"
tar -czvf "../config.tar.gz" .
cd ..
