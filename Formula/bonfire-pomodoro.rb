class BonfirePomodoro < Formula
  desc "Dark Souls-themed 3D TrueColor ASCII Pomodoro timer for terminal"
  homepage "https://github.com/GabrielBaiano/bonfire-pomodoro"
  url "https://github.com/GabrielBaiano/bonfire-pomodoro/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "cdd09659d3d704f313564a1e61e9c19e57abf54565a13d4171cf207c2d35d940"
  license "GPL-3.0-or-later"
  head "https://github.com/GabrielBaiano/bonfire-pomodoro.git", branch: "main"

  def install
    system "make"
    bin.install "bonfire"
    bin.install_symlink "bonfire" => "fireplace"
  end

  test do
    assert_match "histórico", shell_output("#{bin}/bonfire --history 2>&1")
  end
end
