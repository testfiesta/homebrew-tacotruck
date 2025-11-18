class Tacotruck < Formula
  desc "Test/QA data pipeline by TestFiesta"
  homepage "https://github.com/testfiesta/tacotruck"
  version "1.0.0-beta.33"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.33/tacotruck-1.0.0-beta.33-darwin-x64"
      sha256 "a35dcc8142565ed4fa6b1fe70fdf85417bcf0ed75625f01afba066d1e1f97808"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.33/tacotruck-1.0.0-beta.33-darwin-arm64"
      sha256 "01a23a7752dceae06575b79f205ae656c115fe1ac4922d05a451bd972abdd69e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.33/tacotruck-1.0.0-beta.33-linux-x64"
      sha256 "97b1f98d154e2e3f7d23bc0c00cc4e7b8d1e44ca69427d67ae9cbe55e68ff63b"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.33/tacotruck-1.0.0-beta.33-linux-arm64"
      sha256 "b01bb2ba3f31f2b4a683968b79f02aeee44d9d6392cda0b5dff8dcade0d5dff2"
    end
  end

  def install
    bin.install Dir["*"].first => "tacotruck"
  end

  test do
    assert_match "TacoTruck CLI #{version}", shell_output("#{bin}/tacotruck --version")
  end
end
