cask "chisel" do
  version "1.0.0"
  sha256 "9fb7ad652308d69b51972be3b6b57f880c2e16d7eb062a375fea99eb4d70e05c"

  url "https://github.com/Snesnopic/ChiselSwift/releases/download/v#{version}/Chisel-#{version}.zip"
  name "Chisel"
  desc "Lossless file optimizer with a native interface"
  homepage "https://github.com/Snesnopic/ChiselSwift"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "snesnopic/tools/chsl"
  depends_on macos: :sonoma

  app "Chisel.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Chisel.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.snesnopic.chiselswift.plist",
    "~/Library/Saved Application State/com.snesnopic.chiselswift.savedState",
  ]

  caveats <<~EOS
    Chisel is not notarized by Apple. This cask removes the quarantine flag so macOS lets it open.
  EOS
end
