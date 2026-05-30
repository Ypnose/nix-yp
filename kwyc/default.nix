{ lib
, stdenv
, fetchurl
, makeWrapper
, gawk
, iproute2
, nftables
}:

let
  path = lib.makeBinPath ([
    gawk
    iproute2
    nftables
  ]);
in stdenv.mkDerivation rec {
  pname = "kwyc";
  commit = "db76b476a53014a2c2646091137a585ef342cd4a";
  version = "20260530";

  src = fetchurl {
    url = "https://framagit.org/Ypnose/${pname}/-/raw/${commit}/${pname}";
    hash = "sha256-DXV6k/R3EqSgrB7EzqrliaPWvNaWmcM54s8nwQkEEAg=";
  };

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    install -Dm 0755 "$src" "$out/bin/kwyc"
    wrapProgram "$out/bin/kwyc" \
      --prefix PATH : ${path}
  '';

  meta = with lib; {
    description = "Script to initiate WireGuard VPN tunnel";
    homepage = "https://framagit.org/Ypnose/kwyc";
    platforms = platforms.linux;
    mainProgram = "kwyc";
  };
}
