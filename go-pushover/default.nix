{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "go-pushover";
  version = "20251217";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "db1ada6b4998c0357add26ea7f1cbb582ff7c96d";
    hash = "sha256-StSBMZ95LM2SaAX3KqQKzDg6UQR63bJtctgI9DS/ufo=";
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
