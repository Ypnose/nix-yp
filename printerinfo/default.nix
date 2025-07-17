{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "printerinfo";
  version = "20250717";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "dce4bbcb3beaa09d4661e9479e3b19ce02c1e04e";
    hash = "sha256-mMA9Unb0VeKfxtDGEh19cvlE6SJ1Ac85E9C6jmggne0=";
  };

  vendorHash = "sha256-X1nod3uwyazlVFRPJjLP0iLjbCKWX9LIMgRnpfqJl5Y=";

  sourceRoot = "${src.name}/printerinfo";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to show printer info using SNMP";
    platforms = lib.platforms.unix;
  };
}
