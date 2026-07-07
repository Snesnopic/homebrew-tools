class Img2tga < Formula
  desc "Simple utility to convert images to TGA format"
  homepage "https://github.com/Snesnopic/img2tga"
  url "https://github.com/Snesnopic/img2tga/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "9805e540cc9effa313c366bce319fcf1c4113e93f068e0639a45ba35e5f78e1a"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/img2tga --version")
    assert_match "Usage", shell_output("#{bin}/img2tga --help 2>&1")
  end
end
