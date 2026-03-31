cask "claude-usage-monitor" do
  version "1.3.0"
  sha256 "19f03689c5f50e73645e25c73f7397fe96a1cf675e85051c9691097a3ec5337c"

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
