class BinutilsX8664 < Formula
  homepage "https://www.gnu.org/software/binutils/binutils.html"
  url "https://ftpmirror.gnu.org/binutils/binutils-2.42.tar.gz"
  mirror "https://ftp.gnu.org/gnu/binutils/binutils-2.42.tar.gz"
  sha256 "5d2a6c1d49686a557869caae08b6c2e83699775efd27505e01b2f4db1a024ffc"

  def install
    # Set environment variables to help with macOS compatibility
    ENV.append "CFLAGS", "-Wno-error"
    ENV.append "CXXFLAGS", "-Wno-error"
    
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--target=x86_64-unknown-linux-gnu",
                          "--disable-static",
                          "--disable-multilib",
                          "--disable-nls",
                          "--disable-werror",
                          "--with-system-zlib"
    system "make", "MAKEINFO=true", "-j"
    system "make", "MAKEINFO=true", "install"
    system "rm", "-rf", "#{prefix}/share/info"
  end

  test do
    assert true
  end
end
