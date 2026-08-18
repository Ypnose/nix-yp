{ lib
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "emltombox";
  version = "20260818";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "9054e15243cfaa080d5ae65a9e6b1e7bd6d09c86";
    hash = "sha256-mp5WOoSqaRRAbkrqMxUewbDnMEdxdGzodNHC8zyFrVY=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/emltombox";

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    description = "Simple tool to merge EML files to MBOX";
    homepage = "https://github.com/Ypnose/gools";
    platforms = platforms.unix;
    mainProgram = "emltombox";
  };
}
