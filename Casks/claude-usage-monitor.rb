cask "claude-usage-monitor" do
  version "1.3.1"
  sha256 "2df39913b9a7a1feb22217d24b659836ff19620905a877d0c027f08a1d592293"

  url "https://github.com/theDanButuc/Claude-Usage-Monitor/releases/download/v#{version}/ClaudeUsageMonitor-v#{version}.dmg"
  name "Claude Usage Monitor"
  desc "Native macOS menu bar app that tracks your Claude.ai usage at a glance"
  homepage "https://github.com/theDanButuc/Claude-Usage-Monitor"

  depends_on macos: ">= :ventura"

  app "ClaudeUsageMonitor.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ClaudeUsageMonitor.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.yourname.ClaudeUsageMonitor.plist",
    "~/Library/WebKit/com.yourname.ClaudeUsageMonitor",
  ]
end
