class Prismafs < Formula
  desc "A lightweight, layered userspace filesystem inspired by Plan 9"
  homepage "http://ithas-site.com"
  url "https://github.com/goranb131/ITHAS-prismaFS/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "1225745c7a409b16708904772be01dbae015289c9b5c87e0b33a65a3e3f6c8b4"
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