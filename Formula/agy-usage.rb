class AgyUsage < Formula
  desc "Zero-dependency local quota & token usage monitor for Google Antigravity"
  homepage "https://github.com/qiudai0627/agy-usage"
  url "https://github.com/qiudai0627/agy-usage/releases/download/v1.3.0/agy-usage-release.zip"
  version "1.3.0"
  sha256 "4fdd5b0cdab4d504dbbfef9a95a8bb339d672822b74608021a0760595168e42d"
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
        agy-usage serve
        agy-usage summary
    EOS
  end

  test do
    assert_match "Antigravity", shell_output("#{bin}/agy-usage --help")
  end
end
