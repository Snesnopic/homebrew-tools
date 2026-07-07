class Rdbcpp < Formula
  desc "Tencent RDB archive packer/unpacker"
  homepage "https://github.com/Snesnopic/rdbcpp"
  url "https://github.com/Snesnopic/rdbcpp/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "e8e491cf2bbe4825d03a728d01b649f6ab7d05f90f712b4ff13ed312d925b773"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/rdbcpp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rdbcpp --version")
    assert_match "usage", shell_output("#{bin}/rdbcpp --help")
  end
end
