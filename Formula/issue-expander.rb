class IssueExpander < Formula
  include Language::Python::Virtualenv

  desc "Expand GitHub issue references into Markdown links"
  homepage "https://www.github.com/adamwolf/issue-expander"

  url "https://files.pythonhosted.org/packages/c1/6a/f6854e1083a4d3bf54b383cce668963b1d33f156e3ae3329fd0d1771a371/issue_expander-0.1.10.tar.gz"
  sha256 "c26c0d218d2752ac93cf2b1a017c7f05a5fbe53c1b7a32e15fb6c4cd9bc8213c"

  bottle do
    root_url "https://github.com/adamwolf/homebrew-issue-expander/releases/download/issue-expander-0.1.10"
    rebuild 1
    sha256 cellar: :any_skip_relocation, monterey:     "6edfec40948e92544706af3b32cb6902015313b450f3f46e3aa3d9dbbb831e69"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fca3258e70ba9891bf7a220f5962a9afcfad52ae771490ce068321e29b429a9b"
  end

  depends_on "python3"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/37/f7/2b1b0ec44fdc30a3d31dfebe52226be9ddc40cd6c0f34ffc8923ba423b69/certifi-2022.12.7.tar.gz"
    sha256 "35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/96/d7/1675d9089a1f4677df5eb29c3f8b064aa1e70c1251a0a8a127803158942d/charset-normalizer-3.0.1.tar.gz"
    sha256 "ebea339af930f8ca5d7a699b921106c6e29c617fe9606fa7baa043c1cdae326f"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8/click-8.1.3.tar.gz"
    sha256 "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/8b/e1/43beb3d38dba6cb420cefa297822eac205a277ab43e5ba5d5c46faf96438/idna-3.4.tar.gz"
    sha256 "814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530b5526063d02cb4"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/9d/ee/391076f5937f0a8cdf5e53b701ffc91753e87b07d66bae4a09aa671897bf/requests-2.28.2.tar.gz"
    sha256 "98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2df24bf"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/c5/52/fe421fb7364aa738b3506a2d99e4f3a56e079c0a798e9f4fa5e14c60922f/urllib3-1.26.14.tar.gz"
    sha256 "076907bf8fd355cde77728471316625a4d2f7e713c125f51953bb5b3eecf4f72"
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
