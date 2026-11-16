class Mp3packercpp < Formula
  desc "C++ port of mp3packer for lossless MP3 optimization"
  homepage "https://github.com/Snesnopic/mp3packercpp"
  url "https://github.com/Snesnopic/mp3packercpp/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "f6bf0ed510363dd519af966607a2c0fcb7c3f0c77833baa71b839b3dc28ae122"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/bin/mp3packercpp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mp3packercpp --version")
    assert_match "Usage", shell_output("#{bin}/mp3packercpp --help")
  end
end
