class Aux4 < Formula
  desc 'elevate your imagination'
  homepage 'https://aux4.io'
  license 'Apache-2.0'
  version 'v5.0.1'

  def file_info
    if OS.mac?
      if Hardware::CPU.arm?
        %w[aux4-darwin-arm64 d7e88995dbc4821be8291c0b36536a055b83eaaa3c6a0ffd302ce9311a181719]
      else
        %w[aux4-darwin-amd64 6a687bafcd84ef07544813a5dbe6f58c716b724a7e012a905367f68adea0a5de]
      end
    elsif OS.linux?
      if Hardware::CPU.is_32_bit?
        %w[aux4-linux-386 60ccb24a16b4fc990be06fa59eac9be329e0a7340e45a59b138f01658d847da5]
      else
        %w[aux4-linux-amd64 8eb40dcfa33e311e8c64a91f3deec01e840e21bfb4e295fcd5a77c0781e29b9c]
      end
    elsif OS.windows?
      if Hardware::CPU.is_32_bit?
        ['aux4-windows-386.exe', '0a354f5493170e2d7e71620a2ec04626c2c1350d6be6d9f21bcbeb2ce622ce9b']
      else
        ['aux4-windows-amd64.exe', '58f4ebe0eeff8797020203eda5abfeab3a001d1a80bd0e08e3eab63ea2c18188']
      end
    else
      raise 'Unsupported OS'
    end
  end

  url "https://github.com/aux4/aux4/releases/download/#{version}/#{file_info[0]}"
  sha256 file_info[1]

  def install
    if OS.windows?
      bin.install file_info[0] => 'aux4.exe'
    else
      bin.install file_info[0] => 'aux4'
    end
  end

  test do
    if OS.windows?
      system "#{bin}/aux4.exe"
    else
      system "#{bin}/aux4"
    end
  end
end
