class Qadmimes < Formula
  desc "Simple utility to determine file types"
  homepage "https://github.com/Snesnopic/qadmimes"
  url "https://github.com/Snesnopic/qadmimes/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "0a2cb5681010f9cdb06cad9191dca5ebe99e3c165d4fcce8acda8a80e289bc5e"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qadmimes --version")
    assert_match "Usage", shell_output("#{bin}/qadmimes --help")
  end
end
