# Documentation: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Conky < Formula
  desc ""
  homepage ""
  url "https://github.com/brndnmtthws/conky/archive/v1.10.5.zip"
  version "1.10.5"
  sha256 "4014b3793ca8e67537b5c1705a8347b16b7e85eb5350a788407a37d1161f953c"

  depends_on "cmake" => :build
  depends_on "ncurses"
  depends_on "lua"
  depends_on "gettext"
  depends_on :x11 # if your formula requires any X11/XQuartz components
  patch do
    url "https://gist.githubusercontent.com/jfmherokiller/a23b303c0b464361c331ec34e1015320/raw/ef36049bdf6964dee86e0c12090433b82c72f30c/asprintfpatch.patch"
    sha256 ""
  end
  def install

    inreplace "cmake/ConkyPlatformChecks.cmake",'"Linux"','"Darwin"'
    inreplace "cmake/Conky.cmake",'"Linux"','"Darwin"'
    inreplace "src/common.h","#include <string>","#include <string>\n#include <strings.h>"
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test conky`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
