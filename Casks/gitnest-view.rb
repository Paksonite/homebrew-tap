cask "gitnest-view" do
  version "0.1.2"
  sha256 "2ab7eb14e02315a1fa062ccc76b29978659bbc87e9ecdfc48621578ab2df2dea"

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
