class Rdbcpp < Formula
  desc "Tencent RDB archive packer/unpacker"
  homepage "https://github.com/Snesnopic/rdbcpp"
  url "https://github.com/Snesnopic/rdbcpp/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "767a305ebc6939615159719f590b24ff9c1021a9ca3dade711c1671f2bce0f0e"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/rdbcpp"
  end

  test do
    assert_match "usage", shell_output(bin/"rdbcpp", 1)
  end
end
