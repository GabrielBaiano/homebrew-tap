class KeyCaster < Formula
  include Language::Python::Virtualenv

  desc "Lightweight on-screen keystroke displayer for Linux (Wayland, COSMIC, X11)"
  homepage "https://github.com/GabrielBaiano/key-caster"
  url "https://github.com/GabrielBaiano/key-caster/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "87aa686d026212d89fbb8c27de8cd721b54c926e147292245605bfc50f01ce8d"
  license "GPL-3.0-or-later"

  depends_on :linux
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", *std_pip_args(build_isolation: true), "."
    bin.install_symlink libexec/"bin/key-caster"
    bin.install_symlink libexec/"bin/keycaster"
  end

  def caveats
    <<~EOS
      key-caster requires permission to read /dev/input/event* devices.
      Add your user to the 'input' group if you haven't already:
        sudo usermod -aG input $USER
      Then log out and log back in for changes to take effect.
    EOS
  end

  test do
    assert_match "Key-caster", shell_output("#{bin}/key-caster --help 2>&1")
  end
end
