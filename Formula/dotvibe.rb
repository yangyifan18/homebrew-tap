class Dotvibe < Formula
  desc "Migrate AI coding agent configs, memories, skills, prompts, and project rules"
  homepage "https://github.com/yangyifan18/dotvibe"
  url "https://github.com/yangyifan18/dotvibe/archive/refs/tags/v1.1.tar.gz"
  sha256 "dcb58727736a02205eed22ae0f0c5eb4ca0fc7e49170040d72aa58f5476b7bf2"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/yangyifan18/dotvibe/cmd.version=#{version}"
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    ENV["HOME"] = testpath
    ENV["XDG_CONFIG_HOME"] = testpath/".config"

    assert_match "dotvibe version #{version}", shell_output("#{bin}/dotvibe --version")
    assert_match "agent_doctor", shell_output("#{bin}/dotvibe agent doctor --json")
  end
end
