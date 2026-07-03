class Mseedout < Formula
  desc "Recompress miniSEED files to the smallest possible"
  homepage "https://github.com/Snesnopic/mseedout"
   url "https://github.com/Snesnopic/mseedout.git",
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
    assert_match "Usage", shell_output(bin/"mseedout", 255)
  end
end
