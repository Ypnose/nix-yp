{ lib
, stdenv
, fetchzip
}:

stdenv.mkDerivation rec {
  pname = "wg";
  version = "1.0.20210914";

  src = fetchzip {
    url = "https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-${version}.tar.xz";
    hash = "sha256-eGGkTVdPPTWK6iEyowW11F4ywRhd+0IXJTZCqY3OZws=";
  };

  sourceRoot = "${src.name}/src";

  dontConfigure = true;

  installPhase = ''
    install -Dm 0755 wg "$out/bin/wg"
  '';

  meta = with lib; {
    description = "Configuration tool for setting WireGuard tunnel interfaces";
    homepage = "https://www.wireguard.com/";
    platforms = platforms.linux;
    license = licenses.gpl2Only;
    mainProgram = "wg";
  };
}
