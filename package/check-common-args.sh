#!/bin/bash

if [ "$1" = "-copyright" ]; then
    cpyrht_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    source "$cpyrht_path/copy-right.sh"
    exit 1
fi
if [ "$1" = "-v" -o "$1" = "-version" ]; then
    echo "Version 1.0.0 mouse" >&2
    exit 1
fi