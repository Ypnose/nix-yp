{ lib
, stdenv
, fetchurl
}:

stdenv.mkDerivation {
  pname = "yss";
  version = "20260103";

  src = fetchurl {
    url = "https://framagit.org/Ypnose/yss/-/raw/master/yss";
    hash = "sha256-Uhy8L0gZkpV8bglE56bQYdGAampCPFqqM2OFP5Bb910=";
  };

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    install -Dm 0755 $src $out/bin/yss
  '';

  meta = {
    homepage = "https://framagit.org/Ypnose/yss";
    description = "Script to display some information about the current system";
    platforms = lib.platforms.all;
  };
}
