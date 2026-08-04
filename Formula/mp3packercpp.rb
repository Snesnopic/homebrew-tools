class Mp3packercpp < Formula
  desc "C++ port of mp3packer for lossless MP3 optimization"
  homepage "https://github.com/Snesnopic/mp3packercpp"
  url "https://github.com/Snesnopic/mp3packercpp/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "c6e59906860a5b07df711c7c983db8e841396429a5c8df071c386e4efe85a38b"
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
