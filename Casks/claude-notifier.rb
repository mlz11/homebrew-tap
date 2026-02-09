cask "claude-notifier" do
  version "1.11.0"
  sha256 "95a41a639712510e089327790c71e2334be298e05d7f775c82918d4c634c6887"

  url "https://github.com/mlz11/ClaudeNotifier/releases/download/v#{version}/ClaudeNotifier.zip"
  name "ClaudeNotifier"
  desc "macOS notifications with Claude icon for Claude Code hooks"
  homepage "https://github.com/mlz11/ClaudeNotifier"

  depends_on macos: ">= :big_sur"

  app "ClaudeNotifier.app"

  binary "#{appdir}/ClaudeNotifier.app/Contents/MacOS/ClaudeNotifier", target: "claude-notifier"

  postflight do
    puts "\n\e[1;33m  Next step: run \e[1;37mclaude-notifier setup\e[1;33m to configure Claude Code hooks\e[0m\n"
  end

  uninstall quit: "com.mlz11.ClaudeNotifier"

  zap trash: [
    "~/.local/bin/claude-notifier",
  ]
end
