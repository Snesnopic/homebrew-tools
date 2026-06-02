class Mp3packercpp < Formula
  desc "C++ port of mp3packer for bitstream-level MP3 optimization"
  homepage "https://github.com/Snesnopic/mp3packercpp"
  url "https://github.com/Snesnopic/mp3packercpp/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d08ae436f7d7a8781657eef767af82f6440e1fd4c05cf9eca38e44e50efaf9eb"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/bin/mp3packercpp"
  end

  test do
    assert_match "mp3packer", shell_output("#{bin}/mp3packercpp --help", 0)
  end
end
