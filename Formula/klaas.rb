# frozen_string_literal: true

# Homebrew formula for klaas CLI
# Remote access wrapper for Claude Code
class Klaas < Formula
  desc "Remote access CLI for Claude Code - control your sessions from anywhere"
  homepage "https://klaas.sh"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/klaas-sh/cli/releases/download/v#{version}/klaas-darwin-x64.tar.gz"
      sha256 "PLACEHOLDER_MACOS_X64_SHA256"
    end

    on_arm do
      url "https://github.com/klaas-sh/cli/releases/download/v#{version}/klaas-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_MACOS_ARM64_SHA256"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/klaas-sh/cli/releases/download/v#{version}/klaas-linux-x64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X64_SHA256"
    end

    on_arm do
      url "https://github.com/klaas-sh/cli/releases/download/v#{version}/klaas-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64_SHA256"
    end
  end

  def install
    bin.install "klaas"
  end

  def post_install
    # Create install marker for analytics (tracks install event on first run)
    # Use XDG_DATA_HOME or default to ~/.local/share
    data_home = ENV["XDG_DATA_HOME"] || File.join(Dir.home, ".local", "share")
    data_dir = Pathname.new(data_home)/"klaas"
    data_dir.mkpath
    (data_dir/".installed").write(version.to_s)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/klaas --version")
  end
end
