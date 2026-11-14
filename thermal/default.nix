{ lib
, fetchFromGitHub
, buildGoModule
}:

buildGoModule {
  pname = "thermal";
  version = "20260818";

  src = fetchFromGitHub {
    owner = "Ypnose";
    repo = "gools";
    rev = "9054e15243cfaa080d5ae65a9e6b1e7bd6d09c86";
    hash = "sha256-mp5WOoSqaRRAbkrqMxUewbDnMEdxdGzodNHC8zyFrVY=";
  };

  vendorHash = null;

  modRoot = "thermal";

  ldflags = [ "-s" "-w" ];

  meta = {
    description = "Simple tool to display sensors and thermal values";
    homepage = "https://github.com/Ypnose/gools";
    platforms = lib.platforms.linux;
    license = lib.licenses.bsd3;
    mainProgram = "thermal";
  };
}
