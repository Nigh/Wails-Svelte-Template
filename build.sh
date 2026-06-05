#!/bin/bash
# Usage:
#   ./build.sh dev                  - Dev mode (standard window)
#   ./build.sh dev --transparent    - Dev mode (transparent frameless)
#   ./build.sh build                - Production build (standard window)
#   ./build.sh build --transparent  - Production build (transparent frameless)
#
# webkit2_41 tag is auto-included for Ubuntu 24.04+ (webkit2gtk-4.1).

BASE_TAGS="webkit2_41"

if [[ "$2" == "--transparent" ]]; then
    TAGS="$BASE_TAGS,transparent"
    MODE="transparent frameless"
elif [[ "$1" == "--transparent" ]]; then
    TAGS="$BASE_TAGS,transparent"
    MODE="transparent frameless"
else
    TAGS="$BASE_TAGS"
    MODE="standard"
fi

case "$1" in
    dev)
        echo "Starting dev ($MODE mode)..."
        wails dev -tags "$TAGS"
        ;;
    build|"")
        echo "Building ($MODE mode)..."
        wails build -tags "$TAGS"
        ;;
    --transparent)
        echo "Building ($MODE mode)..."
        wails build -tags "$TAGS"
        ;;
    *)
        echo "Usage: $0 {dev|build} [--transparent]"
        exit 1
        ;;
esac
