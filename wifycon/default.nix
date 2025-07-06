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
  version = "20250706";

  src = fetchurl {
    url = "https://raw.githubusercontent.com/Ypnose/dotfiles/master/bin/wifycon";
    hash = "sha256-2EtE7/Kh8Tpeb9ChKRmJ9K64DA7ooqdgfFoXx4pG5ZQ=";
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
