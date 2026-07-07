class Gftcpp < Formula
  desc "Tencent GFT image container packer/unpacker"
  homepage "https://github.com/Snesnopic/gftcpp"
  url "https://github.com/Snesnopic/gftcpp/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "571db1e88fb43071e64d5ad8e164ad0aa3f05cfdc038343b5a212de55ecd961e"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/gftcpp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gftcpp --version")
    assert_match "usage", shell_output("#{bin}/gftcpp --help")
  end
end
