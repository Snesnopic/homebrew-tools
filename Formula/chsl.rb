class Chsl < Formula
  desc "Lossless file optimizer, supporting 160+ types, multithreading and recursive optimization (files inside other files)"
  homepage "https://github.com/Snesnopic/chisel"
  license "MIT"

  head do
    url "https://github.com/Snesnopic/chisel.git", branch: "main"
    depends_on "cmake" => :build
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/Snesnopic/chisel/releases/download/v2.0.0/chsl-macos-arm64.tar.gz"
      sha256 "aff0e16aeb1bc8b720fb2b99877e3900b67462e2ea800d2e9484baea53c8b2cc"
    end
    on_intel do
      url "https://github.com/Snesnopic/chisel/releases/download/v2.0.0/chsl-macos-x64.tar.gz"
      sha256 "7d9e23fbb16d8f455b9f7eeec0b6ab05c0351cde8ff488c5a3d993e5bf2ebf69"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Snesnopic/chisel/releases/download/v2.0.0/chsl-linux-x64-gcc.tar.gz"
      sha256 "60d8dd11af9c16db5d40e51fe5e2b9327d5eecdffe346618fc068ee5df17a532"
    end
    on_arm do
      url "https://github.com/Snesnopic/chisel/releases/download/v2.0.0/chsl-linux-arm64.tar.gz"
      sha256 "d98b873f3299887e658053ae1e912bdf99653b073d27dc2d54f5ed55e3a9a7b6"
    end
  end

  def install
    if build.head?
      system "cmake", "-S", ".", "-B", "build", *std_cmake_args
      system "cmake", "--build", "build", "--config", "Release"
      bin.install "bin/Release/chsl"
    else
      bin.install "chsl"
      if OS.mac?
        # the release tarballs carry a quarantine flag that makes macOS kill the binary
        chmod "u+w", bin/"chsl"
        quiet_system "/usr/bin/xattr", "-d", "com.apple.quarantine", bin/"chsl"
      end
    end
  end

  test do
    assert_match "chisel", shell_output("#{bin}/chsl --help")
  end
end
