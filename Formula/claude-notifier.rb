class ClaudeNotifier < Formula
  desc "macOS notifications with Claude icon for Claude Code hooks"
  homepage "https://github.com/mlz11/ClaudeNotifier"
  url "https://github.com/mlz11/ClaudeNotifier/archive/refs/tags/v1.16.0.tar.gz"
  sha256 "7ffd9e5e83a4b1ea285f4471bfd5b1eb70cc18ff442a6629e2c832724835cb49"
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
