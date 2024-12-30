class Longchop < Formula
  desc "CLI tool for displaying and analyzing file contents with tree-like structure"
  homepage "https://github.com/donphi/longchop"
  url "https://github.com/donphi/longchop/archive/v1.0.0.tar.gz"
  sha256 "dbd54bae2ce72289c3a831349c84f9e15a8aa01fdf18e27b1df0de91ff94498e" # We'll update this after creating the release
  version "1.0.0"
  
  depends_on "tree"

  def install
    bin.install "bin/longchop"
  end

  test do
    system "#{bin}/longchop", "--help"
  end
end
