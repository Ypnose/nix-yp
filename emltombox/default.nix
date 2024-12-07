{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "emltombox";
  version = "20241207";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "35c7e673b803fde0380b43217d6306553c8e53ec";
    hash = "sha256-UripaWVjPSVxWn1GFV5k/VuUBzcCP3V7ujiysV4lf9U=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/emltombox";

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to merge EML files to MBOX";
    platforms = lib.platforms.unix;
  };
}
