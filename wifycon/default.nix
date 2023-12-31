{ lib
, pkgs
, stdenv
, fetchurl
, makeWrapper
, iproute2
, procps
, wpa_supplicant
, dhcpcd
}:

let
  path = lib.makeBinPath ([
    iproute2
    procps
    wpa_supplicant
    dhcpcd
  ]);
in stdenv.mkDerivation {
  pname = "wifycon";
  version = "20231022";

  src = fetchurl {
    url = "https://raw.githubusercontent.com/Ypnose/dotfiles/master/bin/wifycon";
    hash = "sha256-H0BOmJJRBA1QP10b3kFqCeJfcbUpgmLSO+uu3HQjuIQ=";
  };

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    install -Dm 0755 $src $out/bin/wifycon
    # Make sure shebang is modified
    sed -i "1 s|/usr/bin/mksh|${lib.getBin pkgs.mksh}/bin/mksh|" \
		$out/bin/wifycon
    wrapProgram $out/bin/wifycon \
      --prefix PATH : ${path}
  '';

  meta = {
    homepage = "https://github.com/Ypnose/dotfiles";
    description = "Script to connect on Wi-Fi networks";
    platforms = lib.platforms.all;
  };
}
