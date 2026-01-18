# homebrew-yashiki

Homebrew tap for yashiki, a macOS tiling window manager.

## Repository Structure

```
homebrew-yashiki/
├── Casks/
│   └── yashiki.rb    # Homebrew Cask definition
├── README.md         # User documentation
└── CLAUDE.md         # This file
```

## Cask Update Procedure

When a new yashiki version is released:

1. Get the new version tag from GitHub Releases
2. Calculate SHA256 for both architectures:
   ```sh
   curl -sL "https://github.com/typester/yashiki/releases/download/yashiki-v{VERSION}/Yashiki-arm64-{VERSION}.zip" | shasum -a 256
   curl -sL "https://github.com/typester/yashiki/releases/download/yashiki-v{VERSION}/Yashiki-x86_64-{VERSION}.zip" | shasum -a 256
   ```
3. Update `Casks/yashiki.rb`:
   - Update `version` field
   - Update `sha256 arm:` and `sha256 intel:` fields
4. Commit with message: `yashiki {VERSION}`

## URL Format

- Tag: `yashiki-v{VERSION}` (e.g., `yashiki-v0.1.1`)
- arm64: `https://github.com/typester/yashiki/releases/download/yashiki-v{VERSION}/Yashiki-arm64-{VERSION}.zip`
- x86_64: `https://github.com/typester/yashiki/releases/download/yashiki-v{VERSION}/Yashiki-x86_64-{VERSION}.zip`

## What the Cask Installs

- `Yashiki.app` to `/Applications`
- Symlinks to `/opt/homebrew/bin`:
  - `yashiki` (CLI)
  - `yashiki-layout-tatami` (tatami layout engine)
  - `yashiki-layout-byobu` (byobu layout engine)

## Testing

```sh
# Install from local tap
brew tap typester/yashiki /path/to/homebrew-yashiki
brew install --cask yashiki

# Verify installation
yashiki version

# Uninstall
brew uninstall --cask yashiki
```

## Code Style

- All code in English
- Minimal comments

## Workflow

- When user asks to plan something, present the plan first and wait for approval before implementing
- Do not start implementation until user confirms the plan
