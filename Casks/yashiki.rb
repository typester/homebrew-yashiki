cask "yashiki" do
  arch arm: "arm64", intel: "x86_64"

  version "0.15.0"
  sha256 arm:   "5b2e038e18384b5772446fb7f540b5e1ec9e269ef91cb36fef8cfafa838b068f",
         intel: "67842c2f47a4d577e4d05e305752ac3da49ca2cd3c52a1d95600ea6d5cbcb7e1"

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
