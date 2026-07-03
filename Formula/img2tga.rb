class Img2tga < Formula
  desc "Simple utility to convert images to TGA format"
  homepage "https://github.com/Snesnopic/img2tga"
  url "https://github.com/Snesnopic/img2tga/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "4715c185f4e25746c79e8ededb67707bbfea5e187d0cab47129b3a0111eea659"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    shell_output(bin/"img2tga", 1)
  end
end
