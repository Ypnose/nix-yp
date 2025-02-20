{ lib
, stdenv
, fetchurl
}:

stdenv.mkDerivation {
  pname = "yss";
  version = "20250220";

  src = fetchurl {
    url = "https://framagit.org/Ypnose/yss/-/raw/master/yss";
    hash = "sha256-e47NvHr/0g3C6c0vmZTafyTF3lSDqGp/PhqPd6QH1NI=";
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
