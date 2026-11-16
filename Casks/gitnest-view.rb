cask "gitnest-view" do
  version "0.1.3"
  sha256 "08775bba418ab37f214dfd5dc82442f9172a298617c7cf49a5a5488f6990b47f"

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
