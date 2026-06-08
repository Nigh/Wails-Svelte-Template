# WSTDT Template

Wails Svelte TS DaisyUI Tailwindcss Template

## About

This is a Wails Svelte-TS-DaisyUI-Tailwindcss template.

![](./screenshot.png)

## Live Development

To run in live development mode, run `wails3 dev` in the project directory. This will run a Vite development
server that will provide very fast hot reload of your frontend changes. If you want to develop in a browser
and have access to your Go methods, there is also a dev server that runs on http://localhost:34115. Connect
to this in your browser, and you can call your Go code from devtools.

## Building

To build a redistributable, production mode package, use `wails3 build`.

### Using wails3 CLI

**Dev mode** — uses `WAILS_BUILD_TAGS` environment variable:

```bash
# Linux / macOS
WAILS_BUILD_TAGS=transparent wails3 dev
WAILS_BUILD_TAGS="transparent,gtk3" wails3 dev  # Linux GTK3 only

# PowerShell
$env:WAILS_BUILD_TAGS="transparent"; wails3 dev

# CMD
set WAILS_BUILD_TAGS=transparent && wails3 dev
```

**Build mode** — uses `-tags` flag (all platforms):

```bash
wails3 build
wails3 build -tags transparent
wails3 build -tags "transparent,gtk3"  # Linux GTK3 only
```

### Using build.sh (Linux/macOS)

On Linux or macOS, you can also use the included `build.sh` script:

```bash
./build.sh dev                       # Dev mode (standard window)
./build.sh dev --transparent         # Dev mode (transparent frameless)
./build.sh dev --transparent --gtk3  # Dev mode (transparent, GTK3 backend)
./build.sh build                     # Production build (standard window)
./build.sh build --transparent       # Production build (transparent frameless)
./build.sh build --transparent --gtk3 # Production build (transparent, GTK3 backend)
```

## Transparent Mode

Transparent mode creates a frameless window with a transparent background, useful for overlay-style UIs.

### Platform Support

| Platform | Status | Notes |
|----------|--------|-------|
| macOS | Supported | Works out of the box |
| Windows | Supported | Requires Windows 11 for translucent backdrop |
| Linux (GTK3) | Supported | Requires a compositor; build with `-tags "transparent,gtk3"` |
| Linux (GTK4) | **Not supported** | Wails v3 alpha limitation — `setTransparent()` is a no-op stub |

### Linux Notes

Ubuntu 24.04+ defaults to the GTK4 backend, which does **not** support transparency in wails v3 alpha. To use transparent mode on Linux, build with the GTK3 backend:

```bash
WAILS_BUILD_TAGS="transparent,gtk3" wails3 dev
```

This requires `libgtk-3-dev` and `libwebkit2gtk-4.1-dev` to be installed.

#### GNOME (Mutter) Does Not Support Transparent Windows

GNOME's compositor **Mutter deliberately strips the alpha channel** from client application windows. This means transparent mode will **not work** on any GNOME session (Wayland or X11), regardless of GTK version or build tags.

This is not a bug or misconfiguration — it is an intentional design decision by the GNOME project. The display protocols (Wayland/X11) and GTK itself both fully support transparency; the blocking layer is Mutter.

Affected desktop environments: **GNOME, Ubuntu Desktop (default), GNOME Flashback, Budgie (uses Mutter).**

#### Recommended: Use Hyprland

[Hyprland](https://hyprland.org/) is a Wayland compositor based on wlroots with first-class transparent window support. It is lightweight, actively maintained, and works out of the box with this template.

```bash
# Install Hyprland on Ubuntu 24.04
sudo add-apt-repository ppa:hyprland/hyprland
sudo apt update
sudo apt install hyprland
```

Log out, select **Hyprland** from the login screen (gear icon), then run:

```bash
WAILS_BUILD_TAGS="transparent,gtk3" wails3 dev
```

#### Other Compatible Compositors

| Compositor | Protocol | Install |
|-----------|----------|---------|
| **Hyprland** (recommended) | Wayland | `sudo apt install hyprland` |
| **KWin / KDE Plasma** | Wayland + X11 | `sudo apt install plasma-desktop` |
| **Sway** | Wayland | `sudo apt install sway` |
| **Picom** (with X11 WM) | X11 | `sudo apt install picom` |
