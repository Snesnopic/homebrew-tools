class Qadmimes < Formula
  desc "Simple utility to determine file types"
  homepage "https://github.com/Snesnopic/qadmimes"
  url "https://github.com/Snesnopic/qadmimes/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "c24bd887bdbe5000d9047b83e82a54b669844d834753bab2e3eabc28f446e289"
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
