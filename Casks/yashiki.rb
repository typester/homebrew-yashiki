cask "yashiki" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.1"
  sha256 arm:   "611a96e48131d35b41b4e6044f4651e22a7323b721d690939f0ffbd5336a1339",
         intel: "f7e4117a17f14cf0adc5243c8f51ad1c40887ee5fa74e2389a1d8006d1f55b72"

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
