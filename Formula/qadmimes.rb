class Qadmimes < Formula
  desc "Simple utility to determine file types"
  homepage "https://github.com/Snesnopic/qadmimes"
  url "https://github.com/Snesnopic/qadmimes/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "17e6f4b226354c5b2a26cf3d453e260670a4ef0462b12a5fb68bbb45f7d2b202"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "Usage", shell_output(bin/"qadmimes", 255)
  end
end
