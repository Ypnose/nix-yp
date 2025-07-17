{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "utfdumpcode";
  version = "20250717";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "dce4bbcb3beaa09d4661e9479e3b19ce02c1e04e";
    hash = "sha256-mMA9Unb0VeKfxtDGEh19cvlE6SJ1Ac85E9C6jmggne0=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/utfdumpcode";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to dump Unicode code points";
    platforms = lib.platforms.unix;
  };
}
