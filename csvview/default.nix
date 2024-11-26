{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "csvview";
  version = "20241126";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "fee01f6dfac1eb180f769c137f82cf15fa1f80ff";
    hash = "sha256-m5lF77OsjK7TT2mbcXiJD8VD1cTOziLF+yOTCVYqzLQ=";
  };

  vendorHash = "sha256-m/ASIIuV5W/KNw1YBXrQTLiTSdHA7R3ir5+Ivb3W6Ns=";

  sourceRoot = "${src.name}/csvview";

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to get EDF Tempo color";
    platforms = lib.platforms.unix;
  };
}
