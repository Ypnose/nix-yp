{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "go-pushover";
  version = "20250330";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "d625bdcd70ab9c46e71a92177d3ab6230383e1f7";
    hash = "sha256-pRob+9F/bx19GRA+Ixxcnv7LQ1qvbnByHapCLYijx4c=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/go-pushover";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to send data to Pushover Message API";
    platforms = lib.platforms.unix;
  };
}
