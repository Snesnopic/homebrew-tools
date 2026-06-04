class Flacoutcpp < Formula
  desc "C++ recreation of flacout for FLAC recompression"
  homepage "https://github.com/Snesnopic/flacoutcpp"
  url "https://github.com/Snesnopic/flacoutcpp/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d2b7fd022c4f76c82a489c7707513ce210b1d56d83e0ed5c8f037b4cdf093a55"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "Usage", shell_output(bin/"flacoutcpp", 255)
  end
end
