class PortsManager < Formula
  desc "Simple, fast, and reliable CLI tool for managing port mappings"
  homepage "https://github.com/adi-family/cli-ports-manager"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/adi-family/cli-ports-manager/releases/download/v0.1.0/ports-manager-macos-arm64"
      sha256 "654c9ac05065ba17f96cf03a010fdb711abe5a6d60bc034cfdf115f4f2accb9f"
    else
      url "https://github.com/adi-family/cli-ports-manager/releases/download/v0.1.0/ports-manager-macos-amd64"
      sha256 "5c7612a952595d0951bc858f5bb46c5e92469113b10b5b17b7391be25bef7922"
    end
  end

  on_linux do
    url "https://github.com/adi-family/cli-ports-manager/releases/download/v0.1.0/ports-manager-linux-amd64"
    sha256 "7545b36c8500f4ccfb1177ca66def1adb8e2b218a0f9d6832a034cd137a5f20d"
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
