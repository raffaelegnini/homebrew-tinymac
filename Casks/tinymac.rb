cask "tinymac" do
  version "1.1.0"
  sha256 "a10028f2815ff601151eba30f44bb2e71306cae50eeeff11ba37f1cde1b8a4c6"

  url "https://github.com/raffaelegnini/tinymac/releases/download/v#{version}/TinyMac-#{version}-macOS.zip"
  name "TinyMac"
  desc "Mouse and keyboard macro recorder, a 1:1 port of TinyTask"
  homepage "https://github.com/raffaelegnini/tinymac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "TinyMac.app"

  # The app is signed ad hoc, not notarised: without this, Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/TinyMac.app"]
  end

  caveats <<~EOS
    TinyMac needs two permissions in System Settings > Privacy & Security:
      Accessibility (to replay input) and Input Monitoring (to record input).
    Grant both, then quit TinyMac and open it again.
  EOS
end
