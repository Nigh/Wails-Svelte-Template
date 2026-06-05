#!/bin/bash
# Usage: ./build.sh [--transparent]
if [[ "$1" == "--transparent" ]]; then
    echo "Building with transparent frameless window..."
    wails build -tags transparent
else
    echo "Building with standard window..."
    wails build
fi
