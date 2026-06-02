class Gftcpp < Formula
  desc "Tencent GFT image container packer/unpacker"
  homepage "https://github.com/Snesnopic/gftcpp"
  url "https://github.com/Snesnopic/gftcpp/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "fde3363d3cb419365c7077e6e77763483b9e303d0f06dd9e77bd9ea483c7d82f"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/gftcpp"
  end

  test do
    assert_match "usage", shell_output("#{bin}/gftcpp", 1)
  end
end
