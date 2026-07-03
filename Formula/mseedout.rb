class Mseedout < Formula
  desc "Recompress miniSEED files to the smallest possible valid output using dynamic programming"
  homepage "https://github.com/Snesnopic/mseedout"
  url "https://github.com/Snesnopic/mseedout/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "abaebeb75a2c3192178725464d9cdba417748c9c5bdf123aa34bb71518ae4a43"
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
