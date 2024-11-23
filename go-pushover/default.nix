{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "go-pushover";
  version = "20241123";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "a41d8aa76ce769b7aa045590ec93ffc0c954c9f3";
    hash = "sha256-dYwRh5bx5XelcS6mqy4Gmw5Di8uzjxufXyFf0U1Ne+s=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/go-pushover";

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to send data to Pushover Message API";
    platforms = lib.platforms.unix;
  };
}
