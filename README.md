# homebrew-yashiki

Homebrew tap for [yashiki](https://github.com/typester/yashiki), a macOS tiling window manager.

## Installation

```sh
brew tap typester/yashiki
brew install --cask yashiki
```

## What gets installed

- `Yashiki.app` in `/Applications`
- `yashiki` CLI in `/opt/homebrew/bin` (symlink)
- `yashiki-layout-tatami` in `/opt/homebrew/bin` (symlink)
- `yashiki-layout-byobu` in `/opt/homebrew/bin` (symlink)

## Post-installation setup

### Grant Accessibility permission

yashiki requires Accessibility permission to manage windows.

1. Open **System Preferences** > **Privacy & Security** > **Accessibility**
2. Click the lock icon to make changes
3. Add **Yashiki.app** to the list and enable it

### Create config file

```sh
mkdir -p ~/.config/yashiki
cat > ~/.config/yashiki/init << 'EOF'
#!/bin/sh

# Layout configuration
yashiki layout-set-default tatami

# Tag bindings (tag N = $((1<<(N-1))))
yashiki bind alt-1 tag-view 1
yashiki bind alt-2 tag-view 2
yashiki bind alt-3 tag-view 4
yashiki bind alt-shift-1 window-move-to-tag 1
yashiki bind alt-shift-2 window-move-to-tag 2
yashiki bind alt-shift-3 window-move-to-tag 4

# Window focus
yashiki bind alt-tab window-focus next
yashiki bind alt-shift-tab window-focus prev

# Layout commands
yashiki bind alt-return retile
yashiki bind alt-comma layout-cmd inc-main-count
yashiki bind alt-period layout-cmd dec-main-count
yashiki bind alt-h layout-cmd dec-main-ratio
yashiki bind alt-l layout-cmd inc-main-ratio

# Multi-monitor
yashiki bind alt-o output-focus next
yashiki bind alt-shift-o output-send next
EOF
chmod +x ~/.config/yashiki/init
```

### Start yashiki

```sh
yashiki start
```

## Usage

```sh
yashiki                           # Show help
yashiki start                     # Start daemon
yashiki version                   # Show version
yashiki quit                      # Quit daemon
```

See [yashiki documentation](https://github.com/typester/yashiki) for full CLI reference.

## Uninstall

```sh
brew uninstall --cask yashiki
brew untap typester/yashiki
```

To remove config and runtime files:

```sh
rm -rf ~/.config/yashiki
rm -f /tmp/yashiki.sock /tmp/yashiki.pid
```
