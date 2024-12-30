class Longchop < Formula
  desc "CLI tool for displaying and analyzing file contents with tree-like structure"
  homepage "https://github.com/donphi/longchop"
  url "https://github.com/donphi/longchop/archive/v1.0.0.tar.gz"
  sha256 "52c619e9a093e4a8ddc5205229dd2f710752fb28c75105b0bc3adad0555d8f24" # We'll update this after creating the release
  version "1.0.1"
  
  depends_on "tree"

  def install
    bin.install "bin/longchop"
  end

  test do
    system "#{bin}/longchop", "--help"
  end
end
