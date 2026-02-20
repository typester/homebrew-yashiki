cask "yashiki" do
  arch arm: "arm64", intel: "x86_64"

  version "0.11.6"
  sha256 arm:   "298a3c1ecbd84295d0b8e7c63d6f8f61385e8efd7c981bd85e3ccd1fcf284c46",
         intel: "5a9197173ccd443603403197e606240a44ad3abe3b456ed1352f0f94b2bdff77"

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
