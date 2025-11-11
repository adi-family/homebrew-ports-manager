class PortsManager < Formula
  desc "Simple, fast, and reliable CLI tool for managing port mappings"
  homepage "https://github.com/adi-family/cli-ports-manager"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/adi-family/cli-ports-manager/releases/download/v0.1.1/ports-manager-macos-arm64"
      sha256 "b11952ccf2db7289b9e074e8340d8f176ecdeab7ff6a7b8ffaa375c73b4c0c20"
    else
      url "https://github.com/adi-family/cli-ports-manager/releases/download/v0.1.1/ports-manager-macos-amd64"
      sha256 "cf197faa820c4cb4e4df10a557d58e2846f105e6f72979b64006338b769fabe5"
    end
  end

  on_linux do
    url "https://github.com/adi-family/cli-ports-manager/releases/download/v0.1.1/ports-manager-linux-amd64"
    sha256 "703a36ae6bb61bd75a103a568e4e8f52d4f2b772f7fd2c0c91e34ca19d8781b1"
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
