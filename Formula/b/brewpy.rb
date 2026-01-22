class Brewpy < Formula
  desc "Python version manager designed for macOS and Homebrew"
  homepage "https://github.com/landoncrabtree/brewpy"
  url "https://github.com/landoncrabtree/brewpy/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "46c7e74b5fff7ba0b8e863e10919877e60911d42641593ead96738cd57507130"
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
    system bin/"brewpy", "--help"
  end
end
