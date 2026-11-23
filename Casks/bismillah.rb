cask "bismillah" do
  version "1.3.5"
  sha256 "849234db970af55eb065323275cb5d4cf3243e7ea46aba6dac6ad507ce97f1a4"

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
