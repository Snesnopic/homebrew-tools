class Chsl < Formula
  desc "Lossless file optimizer, supporting 160+ types, multithreading and recursive optimization (files inside other files)"
  homepage "https://github.com/Snesnopic/chisel"
  version "1.10.0"
  license "MIT"

  head "https://github.com/Snesnopic/chisel.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.10.0/chsl-macos-arm64.tar.gz"
    sha256 "fdbfba31f887722de5d2c1542ccc9421b50c3b82a32f5b632f0c615bca4a258b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.10.0/chsl-macos-x64.tar.gz"
    sha256 "9d3c17bf5c006599b7ee83e24b4d784f2137ecc1c59b9ee1fa0f3a6d37c59320"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.10.0/chsl-linux-x64-gcc.tar.gz"
    sha256 "e88c1f0b2bcd5384066380ba7351d046cce3ab58ff6b4a57c79c6cd84be9850b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.10.0/chsl-linux-arm64.tar.gz"
    sha256 "692d1b95c46812292eda0ee1184dfd6ad539ae3ed33e1f0865120e5e9119a3bf"
  end

  def install
    if build.head?
      system "cmake", "-S", ".", "-B", "build", *std_cmake_args
      system "cmake", "--build", "build", "--config", "Release"
      bin.install "bin/Release/chsl"
    else
      bin.install "chsl"
    end
  end

  test do
    assert_match "chisel", shell_output("#{bin}/chsl --help")
  end
end
