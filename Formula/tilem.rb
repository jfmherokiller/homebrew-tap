# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Tilem < Formula
  desc "Tilem ti calculator emulator"
  homepage "http://lpg.ticalc.org/prj_tilem/"
  url "http://downloads.sourceforge.net/project/tilem/tilem/2.0/tilem-2.0.tar.bz2?r=http%3A%2F%2Flpg.ticalc.org%2Fprj_tilem%2Fdownload.html"
  version "2.0"
  sha256 "fc27235a402dfbee35a15a5aa7c9603211ffa5a1f8b1716310ce8f0b7f4743ad"

  # depends_on "cmake" => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on "gtk+"
  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" 
  depends_on "libxml2"
  depends_on "libtool"
  depends_on "jfmherokiller/tap/libticonv"
  depends_on "jfmherokiller/tap/libticables"
  depends_on "jfmherokiller/tap/libticalcs"
  depends_on "jfmherokiller/tap/libtifiles"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test tilem`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/tilem2 --help"
  end
end
