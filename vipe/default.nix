{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "vipe";
  version = "20260125";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "3282bd4798b6edbe8e01c45f5ce8e6120f68c578";
    hash = "sha256-wSXpM1EBKdf8EsEFDYL40ZVNS0c+12vE7XgpUQSa4oM=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/vipe";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to edit piped data";
    platforms = lib.platforms.unix;
  };
}
