class Tacotruck < Formula
  desc "Test/QA data pipeline by TestFiesta"
  homepage "https://github.com/testfiesta/tacotruck"
  version "1.0.0-beta.30"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.30/tacotruck-1.0.0-beta.30-darwin-x64"
      sha256 "1f51b78ef41b246abcd4de80bb6a600bd6957926fe10ac5925fec51fef214b9f"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.30/tacotruck-1.0.0-beta.30-darwin-arm64"
      sha256 "03763eed90b93bccba75ebc082f63180c9045216444b23c550ad5fa9846b163b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.30/tacotruck-1.0.0-beta.30-linux-x64"
      sha256 "f2f220917e60fa2424ead3a265a3145d9b1be5ea6e9243cb9ae4b7418b895f34"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.30/tacotruck-1.0.0-beta.30-linux-arm64"
      sha256 "9ef42cbe4940a8c3e7c3eb1d39c2341ad0881a4e26f826d41f1be1178c2378c2"
    end
  end

  def install
    bin.install Dir["*"].first => "tacotruck"
  end

  test do
    assert_match "TacoTruck CLI #{version}", shell_output("#{bin}/tacotruck --version")
  end
end
