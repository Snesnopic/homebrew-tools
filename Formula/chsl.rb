class Chsl < Formula
  desc "Lossless file optimizer, supporting 160+ types, multithreading and recursive optimization (files inside other files)"
  homepage "https://github.com/Snesnopic/chisel"
  version "1.11.0"
  license "MIT"

  head "https://github.com/Snesnopic/chisel.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.11.0/chsl-macos-arm64.tar.gz"
    sha256 "6a7bef8fcf0973e70b466c23b08d3d70298f19196d56ee6c143bf586e0ffb532"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.11.0/chsl-macos-x64.tar.gz"
    sha256 "363594ae079da1f6357b72ec49fdc2f64dce4e47e6a66ba613be6b56e7bbd871"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.11.0/chsl-linux-x64-gcc.tar.gz"
    sha256 "a8d1ad54e9d6f6053adf2d188e98f7601aa1bdab2df4432350a5391b38d0564a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.11.0/chsl-linux-arm64.tar.gz"
    sha256 "a6db8c1d42e6823c2f5897f818a50538a0afea282f7493f84c3623e10efdca7a"
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
