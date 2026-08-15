class Optigif < Formula
  desc "Losslessly optimize GIF files"
  homepage "https://github.com/Snesnopic/optigif"
  url "https://github.com/Snesnopic/optigif/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "cb9ded3773a2298786ef5abe286fd16343b0e384f406e84b4d743ff3301a941a"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/optigif --version")
    assert_match "usage", shell_output("#{bin}/optigif --help 2>&1")
  end
end
