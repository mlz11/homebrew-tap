class ClaudeNotifier < Formula
  desc "macOS notifications with Claude icon for Claude Code hooks"
  homepage "https://github.com/mlz11/ClaudeNotifier"
  url "https://github.com/mlz11/ClaudeNotifier/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "52449b2a66630d986fc5089a54172d79a9d57923c07f8330c099d3f22a0f193a"
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
