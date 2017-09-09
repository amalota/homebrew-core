class Ktoblzcheck < Formula
  desc "Library for German banks"
  homepage "https://ktoblzcheck.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/ktoblzcheck/ktoblzcheck-1.49.tar.gz"
  sha256 "e8971bc6689ea72b174c194bd43ba2c0b65112b0c3f9fd2371562e0c3ab57d29"

  bottle do
    sha256 "d176f6ea34fbda13e6ce060bb39d091919593840bef7db54eb4fa7996fcbdef1" => :sierra
    sha256 "2bb0e477b065ae93362a88b4e4174ec11012f922daaac023821e11b990f9d3d3" => :el_capitan
    sha256 "fdae7050c9000d7793a336a9baa3f3903922d385fe9cf8d0c61ca5c08f595520" => :yosemite
    sha256 "7a9fda64f86b9762bb98e48299a0d35884f6d1163f8ed8647db9764ad9b76a9c" => :mavericks
    sha256 "176bf59fd3b5cedac348101b150d2e13e33c08798d838a6ad3af50091ab6531a" => :mountain_lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    ENV.deparallelize
    system "make", "install"
  end

  test do
    assert_match /Ok/, shell_output("#{bin}/ktoblzcheck --outformat=oneline 10000000 123456789", 0)
    assert_match /unknown/, shell_output("#{bin}/ktoblzcheck --outformat=oneline 12345678 100000000", 3)
  end
end
