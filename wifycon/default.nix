{ lib
, stdenv
, fetchFromGitHub
, makeWrapper
, mksh
, iproute2
, procps
, wpa_supplicant
, dhcpcd
}:

stdenv.mkDerivation {
  pname = "wifycon";
  version = "20250706";

  src = fetchFromGitHub {
    owner = "Ypnose";
    repo = "dotfiles";
    rev = "fb003b518b89ccbbf0d639e38779a96c160c59b0";
    hash = "sha256-62nxLOpktgXiitwmRNCBNtZjS6USMzptElRY/lpHQEg=";
  };

  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    install -Dm 0755 ./bin/wifycon "$out/bin/wifycon"
    # Make sure shebang is modified
    sed -i "1 s|/usr/bin/mksh|${lib.getBin mksh}/bin/mksh|" \
      $out/bin/wifycon
    wrapProgram "$out/bin/wifycon" \
      --prefix PATH : "${lib.makeBinPath [ iproute2 procps wpa_supplicant dhcpcd ]}"

    runHook postInstall
  '';

  meta = {
    description = "Script to connect on Wi-Fi networks";
    homepage = "https://github.com/Ypnose/dotfiles";
    platforms = lib.platforms.linux;
    license = lib.licenses.bsd3;
    mainProgram = "wifycon";
  };
}
