{ lib
, stdenv
, fetchurl
, makeWrapper
, hostname
, coreutils-full
, gawk
}:

let
  path = lib.makeBinPath ([
    hostname
    coreutils-full
    gawk
  ]);
in stdenv.mkDerivation {
  pname = "yss";
  version = "20260526";

  src = fetchurl {
    url = "https://framagit.org/Ypnose/yss/-/raw/master/yss";
    hash = "sha256-AQZTlkjaDdcx8roUFunC8TXb4jtBpCcdWmBErVzmXSQ=";
  };

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    install -Dm 0755 "$src" "$out/bin/yss"
    wrapProgram "$out/bin/yss" \
      --prefix PATH : ${path}
  '';

  meta = with lib; {
    description = "Script to display some information about the current system";
    homepage = "https://framagit.org/Ypnose/yss";
    platforms = platforms.linux;
    mainProgram = "yss";
  };
}
