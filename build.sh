#!/bin/bash
# Usage:
#   ./build.sh dev                  - Dev mode (standard window)
#   ./build.sh dev --transparent    - Dev mode (transparent frameless)
#   ./build.sh build                - Production build (standard window)
#   ./build.sh build --transparent  - Production build (transparent frameless)

if [[ "$2" == "--transparent" ]] || [[ "$1" == "--transparent" ]]; then
    TAGS="transparent"
    MODE="transparent frameless"
else
    TAGS=""
    MODE="standard"
fi

case "$1" in
    dev)
        echo "Starting dev ($MODE mode)..."
        if [[ -n "$TAGS" ]]; then
            export WAILS_BUILD_TAGS="$TAGS"
            wails3 dev
        else
            wails3 dev
        fi
        ;;
    build|"")
        echo "Building ($MODE mode)..."
        if [[ -n "$TAGS" ]]; then
            wails3 build -tags "$TAGS"
        else
            wails3 build
        fi
        ;;
    --transparent)
        echo "Building ($MODE mode)..."
        wails3 build -tags "$TAGS"
        ;;
    *)
        echo "Usage: $0 {dev|build} [--transparent]"
        exit 1
        ;;
esac
