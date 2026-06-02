class Img2tga < Formula
  desc "Simple utility to convert images to TGA format"
  homepage "https://github.com/Snesnopic/img2tga"
  url "https://github.com/Snesnopic/img2tga/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f976e2be94c6c61245580ee3a7cc441c12804240da8b8495ca9c61d1e8549402"
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
