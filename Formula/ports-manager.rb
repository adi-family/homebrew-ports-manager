class PortsManager < Formula
  desc "Simple, fast, and reliable CLI tool for managing port mappings"
  homepage "https://github.com/adi-family/cli-ports-manager"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/adi-family/cli-ports-manager/releases/download/v0.1.0/ports-manager-macos-arm64"
      sha256 "PLACEHOLDER_ARM64_SHA256"
    else
      url "https://github.com/adi-family/cli-ports-manager/releases/download/v0.1.0/ports-manager-macos-amd64"
      sha256 "PLACEHOLDER_AMD64_SHA256"
    end
  end

  on_linux do
    url "https://github.com/adi-family/cli-ports-manager/releases/download/v0.1.0/ports-manager-linux-amd64"
    sha256 "PLACEHOLDER_LINUX_SHA256"
  end

  def install
    bin.install "ports-manager-macos-arm64" => "ports-manager" if Hardware::CPU.arm? && OS.mac?
    bin.install "ports-manager-macos-amd64" => "ports-manager" if Hardware::CPU.intel? && OS.mac?
    bin.install "ports-manager-linux-amd64" => "ports-manager" if OS.linux?
  end

  test do
    assert_match "ports-manager", shell_output("#{bin}/ports-manager --help")
  end
end
