class Flacoutcpp < Formula
  desc "C++ recreation of flacout for FLAC recompression"
  homepage "https://github.com/Snesnopic/flacoutcpp"
  url "https://github.com/Snesnopic/flacoutcpp.git",
      tag:      "v1.0.0",
      using:    :git,
      submodules: true
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "Usage", shell_output(bin/"flacoutcpp", 1)
  end
end
