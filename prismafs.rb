class Prismafs < Formula
  desc "A lightweight, layered userspace filesystem inspired by Plan 9"
  homepage "http://ithas-site.com"
  url "https://github.com/goranb131/ITHAS-prismaFS/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "a3f7380c7c8c4f73c2cfaef3527a1a7026cbe72749e9934a624ec8655c26b4a7"
  license "Apache-2.0"

  def install
    system "make", "CC=clang", "install", "INSTALL_DIR=#{prefix}/bin", "MAN_DIR=#{man1}"
  end

  test do
    # Check if the binary exists
    assert_predicate bin/"prismafs", :exist?, "prismafs binary not installed"
    # Ensure it runs correctly
    system "#{bin}/prismafs", "--version"
  end
end