class Tacotruck < Formula
  desc "Test/QA data pipeline by TestFiesta"
  homepage "https://github.com/testfiesta/tacotruck"
  version "1.0.0-beta.32"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.32/tacotruck-1.0.0-beta.32-darwin-x64"
      sha256 "df6330941e0b0be5313b9dcb083f7fbb6afcc0adf07b71ecadf473ad995a5e01"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.32/tacotruck-1.0.0-beta.32-darwin-arm64"
      sha256 "7a14dd79b49143f86c79b7ac1bf546f582e9f6b6304d32c6dacb629d97effb79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.32/tacotruck-1.0.0-beta.32-linux-x64"
      sha256 "d12b7ebb5499ceb52e00caf85ac7909731bb186ddef380891feb304aed6f77eb"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.32/tacotruck-1.0.0-beta.32-linux-arm64"
      sha256 "1e179e90a58fe558cb04159377231904db1329a1736dded77b056551f45ba08f"
    end
  end

  def install
    bin.install Dir["*"].first => "tacotruck"
  end

  test do
    assert_match "TacoTruck CLI #{version}", shell_output("#{bin}/tacotruck --version")
  end
end
