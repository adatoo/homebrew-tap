# The Homebrew cask, rendered by `task release:cask` (version and sha256 filled in)
# and pushed to adatoo/homebrew-tap by the Release workflow (ADR D-033). Edit it here,
# not in the tap: the tap's copy is overwritten on every release.
cask "quail-ai" do
  version "0.56.0"
  sha256 "d096ee7be4448a043b2bd203a1d25cfc7145e0fbb25f0bf613e3ea4614f93148"

  url "https://github.com/adatoo/quail/releases/download/v#{version}/Quail-#{version}.dmg"
  name "Quail"
  desc "Menu bar app that runs local LLM servers"
  homepage "https://quail-ai.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Quail updates itself (Sparkle), so `brew upgrade` leaves it alone unless --greedy.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Quail.app"
  # The `quail` command-line tool ships inside the app.
  binary "#{appdir}/Quail.app/Contents/Helpers/quail"

  # Downloaded models live in a folder you choose, so they are deliberately not listed here.
  zap trash: [
    "~/Library/Application Support/Quail",
    "~/Library/Caches/com.datoos.quail",
    "~/Library/Logs/Quail",
    "~/Library/Preferences/com.datoos.quail.plist",
  ]
end
