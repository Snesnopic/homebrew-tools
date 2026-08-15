class Flacoutcpp < Formula
  desc "Recompress FLAC files to the smallest possible"
  homepage "https://github.com/Snesnopic/flacoutcpp"
  url "https://github.com/Snesnopic/flacoutcpp.git",
      tag:      "v1.4.0",
      using:    :git,
      submodules: true
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/flacoutcpp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flacoutcpp --version")
    assert_match "Usage", shell_output("#{bin}/flacoutcpp --help 2>&1")
  end
end
