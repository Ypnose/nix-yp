{ lib
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "printerinfo";
  version = "20260509";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "08fe560c689f2de3ed6938e2187f642dfe470124";
    hash = "sha256-DTGM3ab+MYcuou/dnOpOKbuMs4ZJtxenrBl+EjhmlYg=";
  };

  vendorHash = "sha256-95aTIiAZja0HFdrBq4h9EwzNygBOEWlbjRBXLuXYdm4=";

  sourceRoot = "${src.name}/printerinfo";

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    description = "Simple tool to show printer info using SNMP";
    homepage = "https://github.com/Ypnose/gools";
    platforms = platforms.unix;
    mainProgram = "printerinfo";
  };
}
