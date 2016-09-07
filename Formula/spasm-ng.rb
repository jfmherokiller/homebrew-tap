# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class SpasmNg < Formula
  desc "eZ80 assembler"
  homepage "https://github.com/alberthdev/spasm-ng"
  url "https://github.com/alberthdev/spasm-ng/archive/v0.5-beta.2.tar.gz"
  head "https://github.com/alberthdev/spasm-ng.git"
  sha256 ""
  version "2.0"
  # depends_on "cmake" => :build
  #depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on "openssl" => :recommended


  def install
  args = %W[
    DESTDIR=#{prefix}
  ]

  if build.without? "openssl"
   args << "NO_APPSIGN=1"
  end
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    #system "./configure", "--disable-debug",
     #                     "--disable-dependency-tracking",
     #                     "--disable-silent-rules",
     #                     "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    bin.mkpath
    system "make", *args
    system "make",*args ,"install"
    #system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test spasm-ng`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
