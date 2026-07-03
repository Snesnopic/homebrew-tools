class Mp3packercpp < Formula
  desc "C++ port of mp3packer for bitstream-level MP3 optimization"
  homepage "https://github.com/Snesnopic/mp3packercpp"
  url "https://github.com/Snesnopic/mp3packercpp/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "69cad357561fbb3b13d694b389b3e8f78c5b24bb543947278bad3c2ba1b2780d"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/bin/mp3packercpp"
  end

  test do
    assert_match "mp3packer", shell_output(bin/"mp3packercpp", "--help")
  end
end
