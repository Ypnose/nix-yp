{ lib
, stdenv
, fetchurl
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "wg";
  version = "1.0.20260223";

  src = fetchurl {
    url = "https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-${finalAttrs.version}.tar.xz";
    hash = "sha256-r0WYJ7gL/TG4OwgHf0tYQ6y30YrZozou9TLTCQ8pH78=";
  };

  sourceRoot = "wireguard-tools-${finalAttrs.version}/src";

  strictDeps = true;
  dontConfigure = true;

  installPhase = ''
    runHook preInstall

    install -Dm 0755 wg "$out/bin/wg"

    runHook postInstall
  '';

  meta = {
    description = "Configuration tool for setting WireGuard tunnel interfaces";
    homepage = "https://www.wireguard.com/";
    platforms = lib.platforms.linux;
    license = lib.licenses.gpl2Only;
    mainProgram = "wg";
  };
})
