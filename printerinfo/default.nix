{ lib
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "printerinfo";
  version = "20260523";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "1c1cbe2f3f36e31b5872c99473d8775e3b768462";
    hash = "sha256-3xCKZHYeNtO+ur2Fti6OBr1mZQC3Tcgn3ycVfz3JsII=";
  };

  vendorHash = "sha256-NYbhIzL3rMt7+GZ7PvlBfWBo1pBgfS5WR3PYn72CuSc=";

  sourceRoot = "${src.name}/printerinfo";

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    description = "Simple tool to show printer info using SNMP";
    homepage = "https://github.com/Ypnose/gools";
    platforms = platforms.unix;
    mainProgram = "printerinfo";
  };
}
