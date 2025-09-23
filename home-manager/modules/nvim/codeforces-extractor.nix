{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "codeforces-extractor";
  version = "unstable";

  # Источник — Git репозиторий
  src = pkgs.fetchFromGitHub {
    owner = "yunusey";
    repo = "codeforces-extractor";
    rev = "master";  # или конкретный коммит
    sha256 = "0000000000000000000000000000000000000000000000000000"; # временно
  };

  buildInputs = [
    pkgs.rustc
    pkgs.cargo
    pkgs.pkg-config
    pkgs.openssl
  ];

  cargoSha256 = null; # для cargo deps, можно пересчитать позже

  buildPhase = ''
    export CARGO_HOME=$PWD/cargo-home
    mkdir -p $CARGO_HOME
    cargo install --path . --root $out
  '';

  installPhase = ''
    # Всё уже установлено через --root, обычно пусто
    echo "Installed to $out"
  '';

  meta = with pkgs.lib; {
    description = "Tool to extract Codeforces problems";
    license = licenses.mit;
    homepage = "https://github.com/yunusey/codeforces-extractor";
    maintainers = with maintainers; [ ];
  };
}
