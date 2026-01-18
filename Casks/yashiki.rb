cask "yashiki" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.0"
  sha256 arm:   "7372f753b3608b1dd32ea06801813300c1a607125c02a311a444c88dbde8d5b6",
         intel: "2d19ca038886a2412fda6f4b7bf624412fc96ce46271f5e9146d71025a205e2f"

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
