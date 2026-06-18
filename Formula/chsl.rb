class Chsl < Formula
  desc "Lossless file optimizer, supporting 160+ types, multithreading and recursive optimization (files inside other files)"
  homepage "https://github.com/Snesnopic/chisel"
  version "1.7.0"
  license "MIT"

  head "https://github.com/Snesnopic/chisel.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.7.0/chsl-macos-arm64.tar.gz"
    sha256 "e9274fc8ba35f2a471d25103d9da40144ba765097a1ee1c882b40ccf517dd08a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.7.0/chsl-macos-x64.tar.gz"
    sha256 "c638cb114434de8064a0820eb8b81f5d128a7145a844ed9478ff28611b9f5d97"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.7.0/chsl-linux-x64-gcc.tar.gz"
    sha256 "42aeed65c8da491ac6b882c2de1cf113eb3416c77f7ad18ea325e64cdd9f4086"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.7.0/chsl-linux-arm64.tar.gz"
    sha256 "d033007fdac5c00141fa201e8ef1947275843ca91047b7af350fcf01251c0bd7"
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
