{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "vipe";
  version = "20250112";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "ec0b36affc95737541152dbe001699a430097f7a";
    hash = "sha256-6czQKn31gu9qHs8VUKDFf0kpUbX9roq+bs5wUbeDN0o=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/vipe";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to edit piped data";
    platforms = lib.platforms.unix;
  };
}
