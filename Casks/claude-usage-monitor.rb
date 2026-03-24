cask "claude-usage-monitor" do
  version "1.2.0"
  sha256 "81af2dff4a3b038e3c222f72ac52610000a0e5640c352598dc3d03f43405fd13"

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
