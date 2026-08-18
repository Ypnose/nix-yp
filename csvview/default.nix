{ lib
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "csvview";
  version = "20260818";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "9054e15243cfaa080d5ae65a9e6b1e7bd6d09c86";
    hash = "sha256-mp5WOoSqaRRAbkrqMxUewbDnMEdxdGzodNHC8zyFrVY=";
  };

  vendorHash = "sha256-KECg0iGtG26HRqJ229OP3847r3mbcNv+icpxwx9SYyw=";

  sourceRoot = "${src.name}/csvview";

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    description = "Simple tool to view and edit CSV files";
    homepage = "https://github.com/Ypnose/gools";
    platforms = platforms.unix;
    mainProgram = "csvview";
  };
}
