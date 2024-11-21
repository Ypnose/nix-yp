{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule {
  pname = "go-pushover";
  version = "20241121";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "go-pushover";
    rev = "3c0c6b12750bed87d3fd7d3821a3f8dee80e3e86";
    hash = "sha256-fAJ2Mw5naHXeyRPXVgx0IlYM3Y6fwCcso9415tBMoio=";
  };

  vendorHash = null;

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/go-pushover";
    description = "Simple tool to send data to Pushover Message API";
    platforms = lib.platforms.unix;
  };
}
