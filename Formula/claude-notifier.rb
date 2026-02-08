class ClaudeNotifier < Formula
  desc "macOS notifications with Claude icon for Claude Code hooks"
  homepage "https://github.com/mlz11/ClaudeNotifier"
  url "https://github.com/mlz11/ClaudeNotifier/archive/refs/tags/v1.10.0.tar.gz"
  sha256 "7b37774eed6f277db06de2bd36fce2dfecfa2ab23bae96f42ac8a036731ce7d9"
  license "MIT"

  depends_on :macos

  def install
    system "make", "build"
    prefix.install "build/ClaudeNotifier.app"
    bin.install_symlink prefix/"ClaudeNotifier.app/Contents/MacOS/ClaudeNotifier" => "claude-notifier"
  end

  test do
    system "#{bin}/claude-notifier", "-m", "test", "-t", "test"
  end
end
