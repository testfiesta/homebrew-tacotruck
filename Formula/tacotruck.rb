class Tacotruck < Formula
  desc "Test/QA data pipeline by TestFiesta"
  homepage "https://github.com/testfiesta/tacotruck"
  version "1.0.0-beta.31"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.31/tacotruck-1.0.0-beta.31-darwin-x64"
      sha256 "98460160d8e2290321b1d82ff41ad0ddc4398283beb9c9e271a3eac00f0fff17"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.31/tacotruck-1.0.0-beta.31-darwin-arm64"
      sha256 "11e47015eef0fc964ed0f54e5af84da205114b92d61318d8765c7f2f71dfc8b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.31/tacotruck-1.0.0-beta.31-linux-x64"
      sha256 "82814a7409d06c9fb5d78ffa183ee6e8ae5df605f1ffccab314bd3d99f9d53e4"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.31/tacotruck-1.0.0-beta.31-linux-arm64"
      sha256 "956eb2dbd22e1ddc8d36c22385dff7798e6b0ddd033d713001e46d67a2823a29"
    end
  end

  def install
    bin.install Dir["*"].first => "tacotruck"
  end

  test do
    assert_match "TacoTruck CLI #{version}", shell_output("#{bin}/tacotruck --version")
  end
end
