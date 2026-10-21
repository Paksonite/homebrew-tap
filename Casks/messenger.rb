cask "messenger" do
  version "0.2.0"
  sha256 "03b7286eebb73bdd4d06bb1a4819e1f73ab29c134bdd58c980a7ac543d81f5ef"

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
