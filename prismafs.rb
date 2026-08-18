class Prismafs < Formula
  desc "A lightweight, layered userspace filesystem inspired by Plan 9"
  homepage "http://ithas-site.com"
  url "https://github.com/goranb131/ITHAS-prismaFS/archive/refs/tags/v1.7.1.tar.gz"
  sha256 "684df1bc3445db6f3f997213c9984609c3af0bc5052bc184eb1a837a905726e5"
  license "Apache-2.0"

  def install
    # macFUSE is in /usr/local, outside homebrew on Apple Silicon.
    # Homebrew compiler strips -I/usr/local/include & -L/usr/local/lib,
    # so using CPATH/LIBRARY_PATH 
    ENV.append_path "CPATH", "/usr/local/include"
    ENV.append_path "LIBRARY_PATH", "/usr/local/lib"

    system "make", "install", "BINDIR=#{bin}", "MANDIR=#{man1}"
  end

  test do
    assert_predicate bin/"prismafs", :exist?, "prismafs binary not installed"
    assert_predicate man1/"prismafs.1", :exist?, "prismafs man page not installed"
    # runs correctly and supports -v not --version
    system "#{bin}/prismafs", "-v"
    system "#{bin}/prismafs", "-h"
  end
end