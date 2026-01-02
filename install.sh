#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# TODO install and update fish here

exec fish "$SCRIPT_DIR/install.fish" "$@"
