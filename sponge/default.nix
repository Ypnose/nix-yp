{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "sponge";
  version = "20260205";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "08cee83aed61e7a95ada08a36fc8b469bdc4baf3";
    hash = "sha256-cYiHYSr7B7DxSpgb4yBpSbJkM0BcnmiZ0YfcyrKjQAw=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/sponge";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to absorb stdin to write it in a file";
    platforms = lib.platforms.unix;
  };
}
