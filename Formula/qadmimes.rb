class Qadmimes < Formula
  desc "Simple utility to determine file types"
  homepage "https://github.com/Snesnopic/qadmimes"
  url "https://github.com/Snesnopic/qadmimes/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2f56cfaf3c57462e99efea459a41c46cbfd99b13bc8074c2b6319e2e44851ac0"
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
