{ lib
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "printerinfo";
  version = "20260818";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "9054e15243cfaa080d5ae65a9e6b1e7bd6d09c86";
    hash = "sha256-mp5WOoSqaRRAbkrqMxUewbDnMEdxdGzodNHC8zyFrVY=";
  };

  vendorHash = "sha256-DkVsaJ5FYACqG6zm/SDrkxj1hYNiek0nOMhQ2DM2UEg=";

  sourceRoot = "${src.name}/printerinfo";

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    description = "Simple tool to show printer info using SNMP";
    homepage = "https://github.com/Ypnose/gools";
    platforms = platforms.unix;
    mainProgram = "printerinfo";
  };
}
