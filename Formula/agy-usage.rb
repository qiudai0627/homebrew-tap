class AgyUsage < Formula
  desc "Zero-dependency local quota & token usage monitor for Google Antigravity"
  homepage "https://github.com/qiudai0627/agy-usage"
  url "https://github.com/qiudai0627/agy-usage/releases/download/v1.3.0/agy-usage-release.zip"
  version "1.3.0"
  sha256 "c2ef4041d4595af08e6f8256cb21636cac0f7840ea7c64502a78a8500d3174f1"
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
