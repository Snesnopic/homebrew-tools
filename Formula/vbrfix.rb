class Vbrfix < Formula
  desc "Simple utility to repair MP3 VBR file headers to fix seek issues"
  homepage "https://github.com/Snesnopic/vbrfix"
  url "https://github.com/Snesnopic/vbrfix/archive/refs/tags/v0.34.tar.gz"
  sha256 "c1cd40c74df9cc60c7fdb8934d99cef1d745bc1d7826784f2fbc233b07460a19"
  license "GPL-2.0-or-later"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vbrfix --version")
    assert_match "Usage", shell_output("#{bin}/vbrfix --help")
  end
end
