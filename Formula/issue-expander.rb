class IssueExpander < Formula
  include Language::Python::Virtualenv

  desc "Expand GitHub issue references into Markdown links"
  homepage "https://www.github.com/adamwolf/issue-expander"

  url "https://files.pythonhosted.org/packages/8a/6f/94da18fe0ae64ac83a67a6dd784bb2eb849afcd94a8315f2a1e52c5c079b/issue_expander-0.1.12.tar.gz"
  sha256 "662087a679306983c33b5573e719f8bc353f2047c9b9125507ddc320953ab7f4"

  bottle do
    root_url "https://github.com/adamwolf/homebrew-issue-expander/releases/download/issue-expander-0.1.12"
    sha256 cellar: :any_skip_relocation, monterey:     "c83a444e3a60071f65babeeca4ab395532818f6b2d270186f2c38dcadf947463"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0ffc3a1019b60d498313956e4f5fc854c70105a6258aa25ea4e00dbf2cacb692"
  end

  depends_on "python3"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/37/f7/2b1b0ec44fdc30a3d31dfebe52226be9ddc40cd6c0f34ffc8923ba423b69/certifi-2022.12.7.tar.gz"
    sha256 "35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8/click-8.1.3.tar.gz"
    sha256 "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    (testpath/"inputfile").write "adamwolf/homebrew-issue-expander#3"
    assert_match("[Add test to brew formula #3](https://github.com/adamwolf/homebrew-issue-expander/issues/3)",
                 shell_output("#{bin}/issue-expander inputfile"))
  end
end
