class ClaudeNotifier < Formula
  desc "macOS notifications with Claude icon for Claude Code hooks"
  homepage "https://github.com/mlz11/ClaudeNotifier"
  url "https://github.com/mlz11/ClaudeNotifier/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "85abdc562f5599cedeb425a3fc114ce6ccb515e3695d0146c2bc6cb70b6da4db"
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
