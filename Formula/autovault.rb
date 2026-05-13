class Autovault < Formula
  desc "Local-first vault for agent skills with MCP, validation, and signing"
  homepage "https://autovault.dev"
  url "https://registry.npmjs.org/@autoworks-ai/autovault/-/autovault-0.2.1.tgz"
  sha256 "c8d3eae160a892e32837db3dcae515e843e5383fef52b8141940c8bcf8b6d59f"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/autovault doctor --json 2>&1")
    assert_match "storagePath", output
  end
end
