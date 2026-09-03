#!/usr/bin/env bash
# Ollama-Menu Linux & macOS Launcher
set -e

if command -v ollama-menu &>/dev/null; then
    exec ollama-menu "$@"
elif command -v python3 &>/dev/null; then
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    export PYTHONPATH="$SCRIPT_DIR:$PYTHONPATH"
    exec python3 -m ollama_menu.cli "$@"
else
    echo "Python 3 is required to run ollama-menu."
    exit 1
fi
