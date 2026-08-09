class Mp3packercpp < Formula
  desc "C++ port of mp3packer for lossless MP3 optimization"
  homepage "https://github.com/Snesnopic/mp3packercpp"
  url "https://github.com/Snesnopic/mp3packercpp/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "809a08d8b19fa613c85c054266db4646a46eb62cef41d972674a069c0079484f"
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
