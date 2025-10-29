class Tacotruck < Formula
  desc "Test/QA data pipeline by TestFiesta"
  homepage "https://github.com/testfiesta/tacotruck"
  version "1.0.0-beta.29"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.29/tacotruck-1.0.0-beta.29-darwin-x64"
      sha256 "08375ddad070aaf1d485d94cbf921abd7019b3c5295e5db9ebceced394ae3fe5"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.29/tacotruck-1.0.0-beta.29-darwin-arm64"
      sha256 "f5edaa91c44456f6bb667ecfee6babba2899a05047b6436bacff8c553f213c7f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.29/tacotruck-1.0.0-beta.29-linux-x64"
      sha256 "df9730b29172130ffb606403afc5eefeab364722b0a78773dcb7eee35cdd94b8"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.29/tacotruck-1.0.0-beta.29-linux-arm64"
      sha256 "6055a5bb0ebe7acf8429cf7830209edf42191d53242a39514a9d2987da30b32b"
    end
  end

  def install
    bin.install Dir["*"].first => "tacotruck"
  end

  test do
    assert_match "TacoTruck CLI #{version}", shell_output("#{bin}/tacotruck --version")
  end
end
