class Rdbcpp < Formula
  desc "Tencent RDB archive packer/unpacker"
  homepage "https://github.com/Snesnopic/rdbcpp"
  url "https://github.com/Snesnopic/rdbcpp/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "23810a3e8f5f78fd815b439e325da265a2ca2dd4db8b809e9ec26371cc8113a2"
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
