#!/usr/bin/env bash
set -e

# resolve script dir (symlink safe)
SOURCE="${BASH_SOURCE[0]}"
while [ -L "$SOURCE" ]; do
    DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
SCRIPT_DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

TOOL="$1"
shift || true

[ -z "$TOOL" ] && {
    echo "Usage: tool-rm <tool> [--npm | --gui | --local | --common]"
    exit 1
}