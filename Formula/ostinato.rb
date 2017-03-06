# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Ostinato < Formula
  desc "Network Traffic Generator and Analyzer"
  homepage "http://ostinato.org/"
  url "https://github.com/pstavirs/ostinato/archive/v0.8.zip"
  version "0.8"
  sha256 ""
 # class PcapRequirement < Requirement
 # fatal true
 # default_formula "homebrew/dupes/libpcap"
 # satisfy { File.exist?("/usr/include/pcap.h" }
  #end
  # depends_on "cmake" => :build
    depends_on "pkg-config" => :build
    #depends_on "libpcap"
    depends_on "protobuf@2.6"
    depends_on "https://raw.githubusercontent.com/cartr/homebrew-qt4/master/qt.rb"
  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    system "qmake","PREFIX=#{prefix}","CXXFLAGS=-I/usr/local/opt/protobuf@2.6/include"
    system "make"
    prefix.install "server/drone.app"
    prefix.install "client/Ostinato.app"
    #system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test ostinato`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
