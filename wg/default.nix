{ lib
, stdenv
, fetchzip
}:

stdenv.mkDerivation rec {
  pname = "wg";
  version = "1.0.20210914";

  src = fetchzip {
    url = "https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-${version}.tar.xz";
    sha256 = "sha256-eGGkTVdPPTWK6iEyowW11F4ywRhd+0IXJTZCqY3OZws=";
  };

  sourceRoot = "${src.name}/src";

  dontConfigure = true;

  installPhase = ''
    install -Dm 0755 wg $out/bin/wg
  '';

  meta = {
    description = "Configuration tool for setting WireGuard tunnel interfaces";
    homepage = "https://www.wireguard.com/";
    platforms = lib.platforms.unix;
    license = lib.licenses.gpl2;
  };
}
