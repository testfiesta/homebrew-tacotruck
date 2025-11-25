class Tacotruck < Formula
  desc "Test/QA data pipeline by TestFiesta"
  homepage "https://github.com/testfiesta/tacotruck"
  version "1.0.0-beta.34"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.34/tacotruck-1.0.0-beta.34-darwin-x64"
      sha256 "31ab96e37310b07603c79619b90964133ef0ae9846780b08f072cd640925a363"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.34/tacotruck-1.0.0-beta.34-darwin-arm64"
      sha256 "500426e19ad6bff42026a616e885f35c41bfc606c5dc26750c1a4be56fcb12b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.34/tacotruck-1.0.0-beta.34-linux-x64"
      sha256 "5d4a0c6f95953d3c4e886e401b2105fa20ecf4190d16086ddeb470bdb669acb3"
    end

    on_arm do
      url "https://github.com/testfiesta/tacotruck/releases/download/v1.0.0-beta.34/tacotruck-1.0.0-beta.34-linux-arm64"
      sha256 "0fb71b697bdd3401f34445c5db9b10eaff77ff7c3a91429410b45e308f5733aa"
    end
  end

  def install
    bin.install Dir["*"].first => "tacotruck"
  end

  test do
    assert_match "TacoTruck CLI #{version}", shell_output("#{bin}/tacotruck --version")
  end
end
