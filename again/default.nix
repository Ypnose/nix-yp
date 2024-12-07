{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "again";
  version = "20241207";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "f73d9b16c6dcb98c583ae9eef83e883d7c097472";
    hash = "sha256-zhZLqUGKTGL9SHxr4Ci1VJ5/Vcnm7aN9LSNr6ALH45E=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/again";

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to execute commands repeatedly";
    platforms = lib.platforms.unix;
  };
}
