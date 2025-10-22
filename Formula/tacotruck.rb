class Tacotruck < Formula
  desc "Test/QA data pipeline by TestFiesta"
  homepage "https://github.com/testfiesta/tacotruck"
  version "1.0.0-beta.26"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.26/tacotruck-1.0.0-beta.26-darwin-x64"
      sha256 "0f723ce55ab9881dbfce02683d7e449f27409e7bdb1e83d5183bfc593f5803a5"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.26/tacotruck-1.0.0-beta.26-darwin-arm64"
      sha256 "5a1364fd3c2b59a83aed5f61ac4c8a799d39a2150a9ab37b131922e7daa58fcc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.26/tacotruck-1.0.0-beta.26-linux-x64"
      sha256 "4f52c0af0675e5aa228de6a0420003d45780979777c5863ad85b06c79eb147c9"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.26/tacotruck-1.0.0-beta.26-linux-arm64"
      sha256 "b76e754206f9c29a1cfe3eac368655760b608a5fb64afe7b361ba44504eca6da"
    end
  end

  def install
    bin.install Dir["*"].first => "tacotruck"
  end

  test do
    assert_match "TacoTruck CLI #{version}", shell_output("#{bin}/tacotruck --version")
  end
end
