class Chsl < Formula
  desc "Lossless file optimizer, supporting 160+ types, multithreading and recursive optimization (files inside other files)"
  homepage "https://github.com/Snesnopic/chisel"
  version "1.8.0"
  license "MIT"

  head "https://github.com/Snesnopic/chisel.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.8.0/chsl-macos-arm64.tar.gz"
    sha256 "200fdabd9cf251fb88ad0e3f9aa917ca1ea7634946e7084aa32b8bf39ffa6d7d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.8.0/chsl-macos-x64.tar.gz"
    sha256 "ba05793b82ac5d009b5805d184cddaf7284fa30a016a1155ddfdd20c1b981cc3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.8.0/chsl-linux-x64-gcc.tar.gz"
    sha256 "23d5c3e2a900391f4a078c6ffc3cba2119b1ff7aa1d76a7496c99c691f713fca"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.8.0/chsl-linux-arm64.tar.gz"
    sha256 "ef47d406ec74e4a849ae590eb8e049786dc700002338bf7ba85faedf74d10312"
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
