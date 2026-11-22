cask "bismillah" do
  version "1.3.1"
  sha256 "e8916a290419231f4e623a6bb0853c359d228c3d4967a5be8a604a3069bd0924"

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
