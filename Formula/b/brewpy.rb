class Brewpy < Formula
  desc "Python version manager designed for macOS and Homebrew"
  homepage "https://github.com/landoncrabtree/brewpy"
  url "https://github.com/landoncrabtree/brewpy/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "6b58dd95b4c73007d1bf9cb2e28c0b98e00cf334c27b880d93779f712216017b"
  license "MIT"

  depends_on "go" => :build

  def install
    cd "src" do
      system "go", "build", *std_go_args(ldflags: "-s -w")
    end
  end

  def post_install
    puts <<~EOS
      BrewPy installed successfully!
      Get started by running brewpy to see the available commands.
    EOS
  end

  test do
    system "bin/brewpy", "--help"
  end
end
