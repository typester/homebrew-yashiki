cask "yashiki" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.7"
  sha256 arm:   "d35e3f39a070358d9df677e90794f494ad2d271bbc4e79c4ea75a3760a96b202",
         intel: "19be07713d9dafb26e1425f1de34acb1d4db211157879169c4319546f1aa4090"

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
