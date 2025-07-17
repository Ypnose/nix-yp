{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "csvview";
  version = "20250717";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "dce4bbcb3beaa09d4661e9479e3b19ce02c1e04e";
    hash = "sha256-mMA9Unb0VeKfxtDGEh19cvlE6SJ1Ac85E9C6jmggne0=";
  };

  vendorHash = "sha256-RPOtfiICnOttDs/NQn3aJ6Fli6AYvX+CvgqX2NBjORA=";

  sourceRoot = "${src.name}/csvview";

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to view and edit CSV files";
    platforms = lib.platforms.unix;
  };
}
