cask "spitfire-audio" do
  version "3.3.22,1639562400"
  sha256 "0a4b97c384b790a5ded9e426fb6b14a8401f67222af68225bebcea90e61b630b"

  url "https://d1t3zg51rvnesz.cloudfront.net/p/files/lm/#{version.csv.second}/mac/SpitfireAudio-Mac-#{version.csv.first}.dmg",
      verified: "d1t3zg51rvnesz.cloudfront.net/p/files/lm/"
  name "Spitfire Audio"
  desc "Download manager for Spitfire audio libraries"
  homepage "https://www.spitfireaudio.com/info/library-manager/"

  livecheck do
    url "https://www.spitfireaudio.com/library-manager/download/mac/"
    strategy :header_match do |headers|
      match = headers["location"].match(%r{/(\d+)/.*-(\d+(?:\.\d+)+)\.dmg}i)
      next if match.blank?

      "#{match[2]},#{match[1]}"
    end
  end

  auto_updates true

  app "Spitfire Audio.app"

  uninstall delete: [
    "/Library/LaunchDaemons/com.spitfireaudio.LibraryManagerHelper.plist",
    "/Library/Logs/Spitfire Audio",
    "/Library/PrivilegedHelperTools/com.spitfireaudio.LibraryManagerHelper",
  ]

  zap delete: [
    "~/Library/Caches/com.spitfireaudio.spitfireaudio",
    "~/Library/Preferences/com.spitfireaudio.spitfireaudio.plist",
  ]
end
