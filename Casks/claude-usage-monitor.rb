cask "claude-usage-monitor" do
  version "2.1.0"
  sha256 "892f9b21e5ff518416b597bec6abedc0688202d6558662302d18cffce479c70d"

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
