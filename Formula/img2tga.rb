class Img2tga < Formula
  desc "Simple utility to convert images to TGA format"
  homepage "https://github.com/Snesnopic/img2tga"
  url "https://github.com/Snesnopic/img2tga/archive/refs/tags/latest-build.tar.gz"
  sha256 "fe75953e2441a3c75ed8f3efe5997419ae22f89b1dcfffb7f3258a222e59c03e"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    shell_output("#{bin}/img2tga", 1)
  end
end
