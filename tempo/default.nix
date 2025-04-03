{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "tempo";
  version = "20250403";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "bbdcf69422378cfc4126a4183722cc7128c3b316";
    hash = "sha256-BiuF3XT7o0nILgDsLkJbU0RXSaYg79rpHS1cRhy54G0=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/tempo";

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to get EDF Tempo color";
    platforms = lib.platforms.unix;
  };
}
