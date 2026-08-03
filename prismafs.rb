class Prismafs < Formula
  desc "A lightweight, layered userspace filesystem inspired by Plan 9"
  homepage "http://ithas-site.com"
  url "https://github.com/goranb131/ITHAS-prismaFS/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "3e07acbaee95d942d4cff5f9ae7aa33ac4958e885b52e3a8387c11ae862bad7e"
  license "Apache-2.0"

  def install
    system "make", "install", "BINDIR=#{bin}", "MANDIR=#{man1}"
  end

  test do
    assert_predicate bin/"prismafs", :exist?, "prismafs binary not installed"
    # runs correctly and supports -v not --version
    system "#{bin}/prismafs", "-v"
  end
end