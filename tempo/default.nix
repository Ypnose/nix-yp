{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "tempo";
  version = "20241123";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "a41d8aa76ce769b7aa045590ec93ffc0c954c9f3";
    hash = "sha256-dYwRh5bx5XelcS6mqy4Gmw5Di8uzjxufXyFf0U1Ne+s=";
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
