cask "yashiki" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.2"
  sha256 arm:   "63c4121b125f40d83a24795147a2e82c012ffebaa4df7a9580657649f8e704b5",
         intel: "7134d8022a1be19baf9c869670b99ea32efb0b06ab43df61124c29dc44b8989e"

  url "https://github.com/typester/yashiki/releases/download/yashiki-v#{version}/Yashiki-#{arch}-#{version}.zip"
  name "Yashiki"
  desc "macOS tiling window manager"
  homepage "https://github.com/typester/yashiki"

  app "Yashiki.app"

  binary "#{appdir}/Yashiki.app/Contents/MacOS/yashiki"
  binary "#{appdir}/Yashiki.app/Contents/Resources/layouts/yashiki-layout-tatami"
  binary "#{appdir}/Yashiki.app/Contents/Resources/layouts/yashiki-layout-byobu"

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
