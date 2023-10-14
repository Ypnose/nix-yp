{ lib
, stdenv
, fetchurl
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "yss";
  version = "20231003";

  src = fetchurl {
    url = "https://framagit.org/Ypnose/yss/-/raw/master/yss";
    hash = "sha256-JtWwEl1QTcvy+sbYyS0+VTkhl2FRS8PcRuvIuXLtpDQ=";
  };

  dontUnpack = true;

  installPhase = ''
    install -Dm 0755 $src $out/bin/yss
  '';

  meta = {
    homepage = "https://framagit.org/Ypnose/yss";
    description = "Script to display some information about the current system";
    platforms = lib.platforms.all;
  };
})
