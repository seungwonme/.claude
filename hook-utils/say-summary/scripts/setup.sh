#!/bin/bash
# Setup script for say-summary plugin
# Installs required Python dependencies using uv

set -e

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "Installing say-summary plugin dependencies..."

# Check if uv is available
if ! command -v uv &> /dev/null; then
    echo "Error: uv is not installed. Install it with: curl -LsSf https://astral.sh/uv/install.sh | sh"
    exit 1
fi

# Create venv and install dependencies
cd "$SKILL_DIR"
uv sync

echo "Done! Plugin is ready to use."
echo ""
echo "Note: This plugin requires macOS (uses the 'say' command for TTS)."
