class Autovault < Formula
  desc "Local-first vault for agent skills with MCP, validation, and signing"
  homepage "https://autovault.dev"
  url "https://github.com/autoworks-ai/autovault/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "09038e73b579b4d8601da1195ec1a1a496cd59999fb0499c1bf10044de357adb"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "ci"
    system "npm", "run", "build"
    system "npm", "prune", "--omit=dev"

    libexec.install Dir["*"]
    (bin/"autovault").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/cli.js" "$@"
    EOS
    (bin/"autovault").chmod 0755
  end

  test do
    output = shell_output("#{bin}/autovault doctor --json")
    assert_match "storagePath", output
  end
end
