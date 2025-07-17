{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "again";
  version = "20250717";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "dce4bbcb3beaa09d4661e9479e3b19ce02c1e04e";
    hash = "sha256-mMA9Unb0VeKfxtDGEh19cvlE6SJ1Ac85E9C6jmggne0=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/again";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to execute commands repeatedly";
    platforms = lib.platforms.unix;
  };
}
