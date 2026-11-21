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
      url "https://github.com/Snesnopic/chisel/releases/download/v2.0.1/chsl-macos-arm64.tar.gz"
      sha256 "abbe5c24c0c46f91aad2e052515d535ba57af5cafb5cf66593f8f754bdff31b6"
    end
    on_intel do
      url "https://github.com/Snesnopic/chisel/releases/download/v2.0.1/chsl-macos-x64.tar.gz"
      sha256 "7f14f8134d45d9214d4cdbffae25681cf5b54d0d96cf6a1998e4474e0070d77c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Snesnopic/chisel/releases/download/v2.0.1/chsl-linux-x64-gcc.tar.gz"
      sha256 "186a3f83b1e6a80ad74761773fb14f051f6e340c6f5b08be88db6376e69bdf9e"
    end
    on_arm do
      url "https://github.com/Snesnopic/chisel/releases/download/v2.0.1/chsl-linux-arm64.tar.gz"
      sha256 "c41152837c3b59ce6d9d73def15801f392cfbe77d7136254eed312776307b0f6"
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

  def caveats
    return unless OS.mac?

    <<~EOS
      A native macOS app is available too:
        brew install --cask snesnopic/tools/chisel
    EOS
  end

  test do
    assert_match "chisel", shell_output("#{bin}/chsl --help")
  end
end
