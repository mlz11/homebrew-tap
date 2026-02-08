class ClaudeNotifier < Formula
  desc "macOS notifications with Claude icon for Claude Code hooks"
  homepage "https://github.com/mlz11/ClaudeNotifier"
  url "https://github.com/mlz11/ClaudeNotifier/archive/refs/tags/v1.11.0.tar.gz"
  sha256 "b7104e5582ec1c81698a225bc9763beae8fe700d891f12b8c66446f6a276f9d2"
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
