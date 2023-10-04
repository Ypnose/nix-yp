{ lib
, stdenv
, fetchurl
, makeWrapper
, iproute2
, wpa_supplicant
, dhcpcd
}:

let
  path = lib.makeBinPath ([
    iproute2
    wpa_supplicant
    dhcpcd
  ]);
in stdenv.mkDerivation (finalAttrs: {
  pname = "wifycon";
  version = "20200216";

  src = fetchurl {
    url = "https://raw.githubusercontent.com/Ypnose/dotfiles/master/bin/wifycon";
    hash = "sha256-Q+HBXiJ2YIJqAU80XBWmTbIrgxu4+952aYknCPT1+x8=";
  };

  dontUnpack = true;
  nativeBuildInputs = [ makeWrapper ];
  installPhase = ''
    install -Dm 0755 $src $out/bin/wifycon
    sed -i 's|mksh|env mksh|' $out/bin/wifycon
    wrapProgram $out/bin/wifycon \
      --prefix PATH : ${path}
  '';

  meta = {
    homepage = "https://github.com/Ypnose/dotfiles";
    description = "Script to connect on Wi-Fi networks";
    platforms = lib.platforms.all;
  };
})
