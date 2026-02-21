{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "vipe";
  version = "20260221";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "b66a74c7f32b0fc94cb5868b154c1d0dab893de1";
    hash = "sha256-5yrMzQUxwKD+3VJpDRp3abK3AAFWdviwXpYtAuRFAGo=";
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
