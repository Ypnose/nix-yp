{ lib
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "csvview";
  version = "20260523";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "1c1cbe2f3f36e31b5872c99473d8775e3b768462";
    hash = "sha256-3xCKZHYeNtO+ur2Fti6OBr1mZQC3Tcgn3ycVfz3JsII=";
  };

  vendorHash = "sha256-cuIxIlp4b/X5n2cFUlGdccI1r/LJrxiVY1bhaaUSuyA=";

  sourceRoot = "${src.name}/csvview";

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    description = "Simple tool to view and edit CSV files";
    homepage = "https://github.com/Ypnose/gools";
    platforms = platforms.unix;
    mainProgram = "csvview";
  };
}
