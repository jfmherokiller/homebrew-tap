class Wabbitsign < Formula
  desc "open source linker for most TI models."
  homepage "http://www.ticalc.org/archives/files/fileinfo/390/39060.html"
  url "http://www.ticalc.org/pub/win/asm/wabbit.zip"
  version "1.0"
  sha256 "1dd3c2891320e6fc93185ce4c8062559f6f01c91d2123f808821b60e4983b411"
  depends_on "pkg-config" => :build
  depends_on "openssl"
  resource "additional_files" do
    url "https://gist.githubusercontent.com/jfmherokiller/d4cf59776f3c5e3afb619028e05b80f0/raw/593fc30850b3fa5449b80437f968791af2d6e1f2/Makefile"
    sha256 "d492cb16fbd1fa629c054e281edf7afdc7c2a72e903c0378d093215342d2c679"
  end

  def install
    resource("additional_files").stage { buildpath.install "Makefile" }
    system "make"
    bin.mkdir
    bin.install "wabbitsign"
  end

  test do
    system "false"
  end
end
