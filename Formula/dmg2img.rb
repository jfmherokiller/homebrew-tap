# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Dmg2img < Formula
  desc "dmg2img util"
  homepage "http://vu1tur.eu.org/dmg2img"
  url "http://vu1tur.eu.org/tools/dmg2img-1.6.5.tar.gz"
  version "1.6.5"
  sha256 "400a16cbe5cb2bf8a9eec4a43ef3546e0329f248bbd2a79f6d9a1ebc0b503308"
  depends_on "openssl"

  def install
      args = %W[
    DESTDIR=#{prefix}
  ]
  inreplace "Makefile" do |s|
  s.gsub! "/usr/bin","/bin"
  s.gsub! "-g root", ""
  s.gsub! "-o root", ""
end

    system "make", *args
    system "make", *args,"install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test dmg2img`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
