# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Tilem < Formula
  desc "Tilem ti calculator emulator"
  homepage "http://lpg.ticalc.org/prj_tilem/"
  url "https://downloads.sourceforge.net/project/tilem/tilem/2.0/tilem-2.0.tar.bz2?r=http%3A%2F%2Flpg.ticalc.org%2Fprj_tilem%2Fdownload.html"
  version "2.0"
  sha256 "fc27235a402dfbee35a15a5aa7c9603211ffa5a1f8b1716310ce8f0b7f4743ad"
  head "https://tilem.svn.sourceforge.net/svnroot/tilem/trunk", :using => :svn 

  depends_on :x11 
  depends_on "gtk+"
  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "jfmherokiller/tap/libticonv"
  depends_on "jfmherokiller/tap/libticables"
  depends_on "jfmherokiller/tap/libticalcs"
  depends_on "jfmherokiller/tap/libtifiles"

  def install

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do

    system "#{bin}/tilem2 --help"
  end
end
