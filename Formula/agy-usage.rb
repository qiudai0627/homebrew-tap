class AgyUsage < Formula
  desc "Zero-dependency local quota & token usage monitor for Google Antigravity"
  homepage "https://github.com/qiudai0627/agy-usage"
  url "https://github.com/qiudai0627/agy-usage/releases/download/v1.5.1/agy-usage-release.zip"
  version "1.4.0"
  sha256 "883959fc6d7baea4b520826b52a461a97d71bfb598486dcccad6ecb7aab13bf6"
  license "MIT"

  def install
    libexec.install Dir["*"]
    (bin/"agy-usage").write <<~EOS
      #!/usr/bin/env bash
      exec python3 "#{libexec}/src/cli.py" "$@"
    EOS
  end

  def caveats
    <<~EOS
      To wire Antigravity /statusline + macOS floating pill + local dashboard in one step:
        bash #{opt_libexec}/install.sh
      Or run CLI commands directly:
        agy-usage
        agy-usage watch
        agy-usage daemon start
    EOS
  end

  test do
    assert_match "Antigravity", shell_output("#{bin}/agy-usage --help")
  end
end
