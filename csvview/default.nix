{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "csvview";
  version = "20250315";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "e8b755ba0a3d7df7574294803b94a3d465365c9a";
    hash = "sha256-AuGiMUzzcZ7VknAeEfNhN1sYeeP9hRUhIcNNt2OdYHM=";
  };

  vendorHash = "sha256-hAYS3fGbHbxSmwHCi7+mdGWXYpxK2xCUIij38k84Mwo=";

  sourceRoot = "${src.name}/csvview";

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to view and edit CSV files";
    platforms = lib.platforms.unix;
  };
}
