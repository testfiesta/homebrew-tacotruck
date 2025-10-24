class Tacotruck < Formula
  desc "Test/QA data pipeline by TestFiesta"
  homepage "https://github.com/testfiesta/tacotruck"
  version "1.0.0-beta.27"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.27/tacotruck-1.0.0-beta.27-darwin-x64"
      sha256 "9c56abb477801ac3f7e50bfb4f796d847fbccb89dd99c0f3cdd13c64503fad27"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.27/tacotruck-1.0.0-beta.27-darwin-arm64"
      sha256 "fd7a7d7b21cdc1ea4b45ec2e403571367e70032170d54e62278577ae293e207b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.27/tacotruck-1.0.0-beta.27-linux-x64"
      sha256 "5729a1ca7ee667cd7b6bdbaa9212b622589004effd0ca90451fd739bfb38f236"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.27/tacotruck-1.0.0-beta.27-linux-arm64"
      sha256 "addeaf54070b455656d701e1c5d8b805f08cbc452dc709b6da56aaf1cd2420bc"
    end
  end

  def install
    bin.install Dir["*"].first => "tacotruck"
  end

  test do
    assert_match "TacoTruck CLI #{version}", shell_output("#{bin}/tacotruck --version")
  end
end
