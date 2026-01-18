cask "yashiki" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.0"
  sha256 arm:   "d49f84bf1852ee8e64396889fcfb7a0bcd5d9f441a6b6866559c3ca2c69e902d",
         intel: "f2e8dde6d67b152f833560b58eedef985f4ce1a4345c77ddb34a3db0ab33303b"

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
