cask "messenger" do
  version "0.4.2"
  sha256 "eea08cfff2e5764fbed64d08e03aa8d089f6080489e006ae1f23c416e6d6425f"

  url "https://github.com/Paksonite/messenger/releases/download/v#{version}/Messenger-#{version}.dmg"
  name "Messenger"
  desc "Lightweight native client for Facebook Messenger"
  homepage "https://github.com/Paksonite/messenger"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Updates itself with Sparkle.
  auto_updates true
  depends_on macos: :sequoia

  app "Messenger.app"

  # The app is not notarized: drop the quarantine flag so Gatekeeper doesn't block it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Messenger.app"]
  end

  zap trash: [
    "~/Library/Application Support/pl.paksonite.messenger",
    "~/Library/Caches/pl.paksonite.messenger",
    "~/Library/HTTPStorages/pl.paksonite.messenger",
    "~/Library/HTTPStorages/pl.paksonite.messenger.binarycookies",
    "~/Library/Preferences/pl.paksonite.messenger.plist",
    "~/Library/Saved Application State/pl.paksonite.messenger.savedState",
    "~/Library/WebKit/pl.paksonite.messenger",
  ]
end
