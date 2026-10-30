cask "tinymac-plus" do
  version "1.1.0"
  sha256 "47335f6e8d177e92cd5e9d5dca47f70842c472dce42ab2308c0a472b83ad59a8"

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
