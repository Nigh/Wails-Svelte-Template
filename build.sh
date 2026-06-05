#!/bin/bash
# Usage:
#   ./build.sh dev                       - Dev mode (standard window)
#   ./build.sh dev --transparent         - Dev mode (transparent frameless)
#   ./build.sh dev --transparent --gtk3  - Dev mode (transparent, GTK3 backend)
#   ./build.sh build                     - Production build (standard window)
#   ./build.sh build --transparent       - Production build (transparent frameless)
#   ./build.sh build --transparent --gtk3 - Production build (transparent, GTK3 backend)

TRANSPARENT=false
GTK3=false

for arg in "$@"; do
    case "$arg" in
        --transparent) TRANSPARENT=true ;;
        --gtk3) GTK3=true ;;
    esac
done

TAGS=""
MODE="standard"

if $TRANSPARENT; then
    TAGS="transparent"
    MODE="transparent frameless"
fi

if $GTK3; then
    if [[ -n "$TAGS" ]]; then
        TAGS="$TAGS,gtk3"
    else
        TAGS="gtk3"
    fi
    MODE="$MODE (GTK3)"
fi

case "$1" in
    dev)
        echo "Starting dev ($MODE mode)..."
        if [[ -n "$TAGS" ]]; then
            export WAILS_BUILD_TAGS="$TAGS"
        fi
        wails3 dev
        ;;
    build|"")
        echo "Building ($MODE mode)..."
        if [[ -n "$TAGS" ]]; then
            wails3 build -tags "$TAGS"
        else
            wails3 build
        fi
        ;;
    *)
        echo "Usage: $0 {dev|build} [--transparent] [--gtk3]"
        exit 1
        ;;
esac
