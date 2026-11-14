{ lib
, fetchFromGitHub
, buildGoModule
}:

buildGoModule {
  pname = "csvview";
  version = "20260818";

  src = fetchFromGitHub {
    owner = "Ypnose";
    repo = "gools";
    rev = "9054e15243cfaa080d5ae65a9e6b1e7bd6d09c86";
    hash = "sha256-mp5WOoSqaRRAbkrqMxUewbDnMEdxdGzodNHC8zyFrVY=";
  };

  vendorHash = "sha256-KECg0iGtG26HRqJ229OP3847r3mbcNv+icpxwx9SYyw=";

  modRoot = "csvview";

  ldflags = [ "-s" "-w" ];

  meta = {
    description = "Simple tool to view and edit CSV files";
    homepage = "https://github.com/Ypnose/gools";
    platforms = lib.platforms.unix;
    license = lib.licenses.bsd3;
    mainProgram = "csvview";
  };
}
