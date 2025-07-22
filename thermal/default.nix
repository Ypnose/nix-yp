{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "thermal";
  version = "20250722";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "3e458233de2cc3a1f3122feefd09e2a6e33e0136";
    hash = "sha256-b9cnofrSI4FLBWAqty+BSlxwSChSTiJwQ//tpU8Dxbs=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/thermal";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to display sensors and thermal values";
    platforms = lib.platforms.unix;
  };
}
