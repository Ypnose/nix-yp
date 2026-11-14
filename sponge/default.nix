{ lib
, fetchFromGitHub
, buildGoModule
}:

buildGoModule {
  pname = "sponge";
  version = "20260818";

  src = fetchFromGitHub {
    owner = "Ypnose";
    repo = "gools";
    rev = "9054e15243cfaa080d5ae65a9e6b1e7bd6d09c86";
    hash = "sha256-mp5WOoSqaRRAbkrqMxUewbDnMEdxdGzodNHC8zyFrVY=";
  };

  vendorHash = null;

  modRoot = "sponge";

  ldflags = [ "-s" "-w" ];

  meta = {
    description = "Simple tool to absorb stdin to write it in a file";
    homepage = "https://github.com/Ypnose/gools";
    platforms = lib.platforms.unix;
    license = lib.licenses.bsd3;
    mainProgram = "sponge";
  };
}
