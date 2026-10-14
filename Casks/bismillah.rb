cask "bismillah" do
  version "1.1.3"
  sha256 "1971c2a41316f59f86f8778aa885d962d2c1df701a433a38e49f76078b187456"

  url "https://github.com/hafizuddin-a/bismillah-menubar/releases/download/v#{version}/Bismillah-#{version}.zip"
  name "Bismillah"
  desc "Writes out the bismillah on screen like handwriting every time you open the lid"
  homepage "https://github.com/hafizuddin-a/bismillah-menubar"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself, so `brew upgrade` leaves it alone unless you pass --greedy.
  auto_updates true
  depends_on macos: :sonoma

  app "Bismillah.app"

  # The app is not notarized by Apple, so without this macOS blocks the first launch of a downloaded copy.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Bismillah.app"],
        must_succeed: false
  end

  zap trash: "~/Library/Preferences/com.hafiz.bismillah.plist"
end
