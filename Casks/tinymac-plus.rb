cask "tinymac-plus" do
  version "1.1.1"
  sha256 "ee092125ad98457adca4f1b08b4a3f152f8c232094f907dd1e725537d4534b94"

  url "https://github.com/raffaelegnini/tinymac/releases/download/v#{version}/TinyMacPlus-#{version}-macOS.zip"
  name "TinyMac Plus"
  desc "TinyTask-compatible macro recorder with an editor and extras"
  homepage "https://github.com/raffaelegnini/tinymac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "TinyMacPlus.app"

  # The app is signed ad hoc, not notarised: without this, Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/TinyMacPlus.app"]
  end

  caveats <<~EOS
    TinyMac Plus needs two permissions in System Settings > Privacy & Security:
      Accessibility (to replay input) and Input Monitoring (to record input).
    Grant both, then quit TinyMac Plus and open it again.
  EOS
end
