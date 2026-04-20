cask "claude-usage-monitor" do
  version "2.2.1"
  sha256 "c6cc83ed33d7f40e3624f6673df7811cfea05cdb273f59c24bfdf4f786e77a60"

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
