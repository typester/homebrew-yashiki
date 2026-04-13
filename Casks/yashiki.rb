cask "yashiki" do
  arch arm: "arm64", intel: "x86_64"

  version "0.12.1"
  sha256 arm:   "8cb34d30ce1e69d9a3be373808252cf7854fece8ae8373b6fd15f31b8c696a11",
         intel: "308f6891d2a72f8610180224e3b0c7d2e6a87f825038fc013aebdac2e9a4d751"

  url "https://github.com/typester/yashiki/releases/download/yashiki-v#{version}/Yashiki-#{arch}-#{version}.zip"
  name "Yashiki"
  desc "macOS tiling window manager"
  homepage "https://github.com/typester/yashiki"

  app "Yashiki.app"

  binary "#{appdir}/Yashiki.app/Contents/MacOS/yashiki"
  binary "#{appdir}/Yashiki.app/Contents/Resources/layouts/yashiki-layout-tatami"
  binary "#{appdir}/Yashiki.app/Contents/Resources/layouts/yashiki-layout-byobu"

  zsh_completion "completions/zsh/_yashiki"

  caveats <<~EOS
    Yashiki.app is not signed. On first launch, allow it in
    System Settings > Privacy & Security.

    Or install with: brew install --cask --no-quarantine yashiki
  EOS

  zap trash: [
    "~/.config/yashiki",
    "/tmp/yashiki.sock",
    "/tmp/yashiki.pid",
  ]
end
