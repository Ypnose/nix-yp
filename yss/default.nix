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
in stdenv.mkDerivation rec {
  pname = "yss";
  commit = "90bafc7b68d7dbbd64d098ce9b0b99504e5675ab";
  version = "20260530";

  src = fetchurl {
    url = "https://framagit.org/Ypnose/${pname}/-/raw/${commit}/${pname}";
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
