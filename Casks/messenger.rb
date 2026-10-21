cask "messenger" do
  version "0.3.3"
  sha256 "a30b96ee13bf23ec6f221a1e793b172ef9963d2e87a036b90900e6d1363c965b"

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
    "~/Library/Preferences/pl.paksonite.messenger.plist",
    "~/Library/Saved Application State/pl.paksonite.messenger.savedState",
    "~/Library/WebKit/pl.paksonite.messenger",
  ]
end
