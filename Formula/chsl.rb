class Chsl < Formula
  desc "Experimental project aiming to recreate the functionality of FileOptimizer"
  homepage "https://github.com/Snesnopic/chisel"
  version "1.6.0"
  license "MIT"

  head "https://github.com/Snesnopic/chisel.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.6.0/chsl-macos-arm64.tar.gz"
    sha256 "f393419996284d25def0dd2d4c0e76981eb74cb442e349d16f4ffe56021df8e3"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.6.0/chsl-macos-x64.tar.gz"
    sha256 "bb917dc34011b49eb368f9f17a7370dbaa44edd0a9c34c421fa888f189d7cad9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.6.0/chsl-linux-x64-gcc.tar.gz"
    sha256 "46e5ffd34749cb7f5ca7a8efd37291e6b0ff52ff82244906eb137f76f3cff39e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.6.0/chsl-linux-arm64.tar.gz"
    sha256 "8ab6678ddf515381190ee36d254f9327ec67ecfdb99de4616a2a90eeb25fc791"
  end

  def install
    if build.head?
      system "cmake", "-S", ".", "-B", "build", *std_cmake_args
      system "cmake", "--build", "build", "--config", "Release"
      bin.install "build/bin/Release/chsl"
    else
      bin.install "chsl"
    end
  end

  test do
    assert_match "chisel", shell_output("#{bin}/chsl --help")
  end
end
