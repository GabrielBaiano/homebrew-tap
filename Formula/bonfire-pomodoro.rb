class BonfirePomodoro < Formula
  desc "Dark Souls-themed 3D TrueColor ASCII Pomodoro timer for terminal"
  homepage "https://github.com/GabrielBaiano/bonfire-pomodoro"
  url "https://github.com/GabrielBaiano/bonfire-pomodoro/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d178d40da41898e4f039b7e6631f0fc1a4e85962b427b7038680878297bdc3e6"
  license "GPL-3.0-or-later"

  def install
    system "make"
    bin.install "bonfire"
    bin.install_symlink "bonfire" => "fireplace"
  end

  test do
    assert_match "histórico", shell_output("#{bin}/bonfire --history 2>&1")
  end
end
