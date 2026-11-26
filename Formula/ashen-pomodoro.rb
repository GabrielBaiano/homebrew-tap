class AshenPomodoro < Formula
  desc "Soulsborne 3D TrueColor ANSI Pomodoro timer for the terminal"
  homepage "https://github.com/GabrielBaiano/ashen-pomodoro"
  url "https://github.com/GabrielBaiano/ashen-pomodoro/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "26dd382da11d48a201cc51b3f9bd8ec982f2ca5f4e8bd594a1b76b698edd2011"
  license "GPL-3.0-or-later"
  head "https://github.com/GabrielBaiano/ashen-pomodoro.git", branch: "main"

  def install
    system "make"
    bin.install "bonfire"
    bin.install_symlink "bonfire" => "ashen"
    bin.install_symlink "bonfire" => "fireplace"
  end

  test do
    assert_match(/hist[oó]rico|history|session/i, shell_output("#{bin}/ashen --history 2>&1"))
  end
end
