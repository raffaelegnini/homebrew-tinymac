# Homebrew tap for TinyMac

[TinyMac](https://github.com/raffaelegnini/tinymac) records and replays mouse and keyboard input on macOS. It is a
1:1 port of TinyTask, and comes in two versions.

```bash
brew tap raffaelegnini/tinymac
brew trust raffaelegnini/tinymac   # once: Homebrew only loads casks from taps you trust

brew install --cask tinymac        # TinyMac: TinyTask 1:1, nothing added
brew install --cask tinymac-plus   # TinyMac Plus: the same engine with an editor and extras
```

Both can be installed side by side. Update with `brew upgrade --cask`, remove with `brew uninstall --cask`.

Settings live in `~/Library/Application Support/TinyMac/` and are shared by both apps; uninstalling leaves them in
place.
