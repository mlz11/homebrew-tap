cask "claude-notifier" do
  version "1.13.0"
  sha256 "5af880cebe33c7e95cf399c8b9bf2c2b0982a4bd3ec7bda27d73bac191ba4769"

  url "https://github.com/mlz11/ClaudeNotifier/releases/download/v#{version}/ClaudeNotifier.zip"
  name "ClaudeNotifier"
  desc "macOS notifications with Claude icon for Claude Code hooks"
  homepage "https://github.com/mlz11/ClaudeNotifier"

  depends_on macos: ">= :big_sur"

  app "ClaudeNotifier.app"

  binary "#{appdir}/ClaudeNotifier.app/Contents/MacOS/ClaudeNotifier", target: "claude-notifier"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ClaudeNotifier.app"]
    puts "\n\e[1;33m  Next step: run \e[1;37mclaude-notifier setup\e[1;33m to configure Claude Code hooks\e[0m\n"
  end

  uninstall quit: "com.mlz11.ClaudeNotifier"

  zap trash: [
    "~/.local/bin/claude-notifier",
  ]
end
