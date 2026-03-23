cask "claude-usage-monitor" do
    version "1.0.0"
    sha256 "e3789daea5afebb07102896dcdf92d0dd234b91e795675b5399e5a7f37079a71"

    url "https://github.com/theDanButuc/Claude-Usage-Monitor/releases/download/v#{version}/ClaudeUsageMonitor.dmg"
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
          "~/Library/Preferences/com.whitepixel.ClaudeUsageMonitor.plist",
          "~/Library/WebKit/com.whitepixel.ClaudeUsageMonitor",
        ]
end
