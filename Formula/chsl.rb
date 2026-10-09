class Chsl < Formula
  desc "Lossless file optimizer, supporting 160+ types, multithreading and recursive optimization (files inside other files)"
  homepage "https://github.com/Snesnopic/chisel"
  version "1.12.0"
  license "MIT"

  head "https://github.com/Snesnopic/chisel.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.12.0/chsl-macos-arm64.tar.gz"
    sha256 "58af633350c3708a188e61b0db66314c9abb5613242f09825cf6e9f719a97022"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.12.0/chsl-macos-x64.tar.gz"
    sha256 "d4ab9a2dbe3def0e90722031603a916f45a189bc685b180ea00da6cd73f20a10"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.12.0/chsl-linux-x64-gcc.tar.gz"
    sha256 "e7d2ea87985ab061e86c74c63a523d21d4de13ddff4d17caf23aa98889990355"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.12.0/chsl-linux-arm64.tar.gz"
    sha256 "ec4c008be6bfea7bedc178dc731f7f1558c81eba3f7fdc6335fb56af43ac6bfe"
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
