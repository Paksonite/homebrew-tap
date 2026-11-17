cask "gitnest-view" do
  version "0.1.5"
  sha256 "62f1fb0687d4d8a8d8e654ca5168609a56e105cd375f243512af6182b215f525"

  url "https://github.com/Paksonite/gitnest-view/releases/download/v#{version}/GitNest-View-#{version}.dmg"
  name "GitNest View"
  desc "GitNest for the Mac: all your Git repositories, pull requests and pipelines"
  homepage "https://github.com/Paksonite/gitnest-view"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Updates itself with Sparkle.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "GitNest View.app"

  # The app is not notarized: drop the quarantine flag so Gatekeeper doesn't block it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/GitNest View.app"]
  end

  zap trash: [
    "~/Library/Application Support/GitNest View",
    "~/Library/Caches/pl.paksonite.gitnest-view",
    "~/Library/HTTPStorages/pl.paksonite.gitnest-view",
    "~/Library/Preferences/pl.paksonite.gitnest-view.plist",
    "~/Library/Saved Application State/pl.paksonite.gitnest-view.savedState",
  ]
end
