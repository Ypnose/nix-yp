{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "thermal";
  version = "20250330";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "d625bdcd70ab9c46e71a92177d3ab6230383e1f7";
    hash = "sha256-pRob+9F/bx19GRA+Ixxcnv7LQ1qvbnByHapCLYijx4c=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/thermal";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to display sensors and thermal values";
    platforms = lib.platforms.unix;
  };
}
