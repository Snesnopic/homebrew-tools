class Chsl < Formula
  desc "Lossless file optimizer, supporting 160+ types, multithreading and recursive optimization (files inside other files)"
  homepage "https://github.com/Snesnopic/chisel"
  version "1.9.0"
  license "MIT"

  head "https://github.com/Snesnopic/chisel.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.9.0/chsl-macos-arm64.tar.gz"
    sha256 "fb9dca736f0030a295730988cce852cd4f991256b9791dafbe952ce5c9b4e275"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.9.0/chsl-macos-x64.tar.gz"
    sha256 "9ac21d7d06ee95a321a68229e90cf78b4baad05a63f565bd67080ade68edd46d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.9.0/chsl-linux-x64-gcc.tar.gz"
    sha256 "515e15fbeee8fdd45ffe5a78d10e97f5c1f3f2a8b97a56825dfe76e4e2ba108c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.9.0/chsl-linux-arm64.tar.gz"
    sha256 "9a928f3c3fbe5b2e9badaeac130415183e68d803de9fcb0ac8411297fd2d9efd"
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
