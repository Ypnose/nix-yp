{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "dmarcreport";
  version = "20250612";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "2d07ac34d67149e7db0c8601863c2080762aa793";
    hash = "sha256-FobeYX4XRDpO/pOPaFd1ZLCFnzcC0GBIum0xWTBxS8Q=";
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
