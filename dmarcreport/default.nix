{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "dmarcreport";
  version = "20250227";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "59283125eb1ea37d7de0e1f6a8bfd642022f5c7f";
    hash = "sha256-iF3D1YPiYBVNk1EJ+HNZ8saeQtbkrv+yEnIxAeni0aE=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/dmarcreport";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to display DMARC reports";
    platforms = lib.platforms.unix;
  };
}
