{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "go-pushover";
  version = "20250417";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "36d27ac742a0ed779c91bbd0a8d7f4c121cfe919";
    hash = "sha256-kXzwD3Yr/rM23BOEXOXSddalowUjQhPGAEKdwKIjgMk=";
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
