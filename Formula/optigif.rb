class Optigif < Formula
  desc "Losslessly optimize GIF files"
  homepage "https://github.com/Snesnopic/optigif"
  url "https://github.com/Snesnopic/optigif.git",
      tag:   "v1.0.0",
      using: :git
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
