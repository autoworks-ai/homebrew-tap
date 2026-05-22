class Autovault < Formula
  desc "Local-first vault for agent skills with MCP, validation, and signing"
  homepage "https://autovault.dev"
  url "https://github.com/autoworks-ai/autovault/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "853bfe620cc5d77db9b8ea147ce98e00983fbc0d16f6f4749af122bbf7748649"
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
    ENV["AUTOVAULT_STORAGE_PATH"] = (testpath/"vault").to_s
    output = shell_output("#{bin}/autovault doctor --json")
    assert_match "storagePath", output
  end
end
