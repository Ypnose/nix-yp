{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "csvview";
  version = "20250502";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "9d5dd83abf65c5c06b88dcac4cd9f245944630c2";
    hash = "sha256-yiumfIClrlPbZImv8EpreCMoCcEd5Zt2xf/0TbgXgOA=";
  };

  vendorHash = "sha256-AEK20tpisDt2Z2I9rB+Ay4jTBmjz3r1bKcEFpLye9co=";

  sourceRoot = "${src.name}/csvview";

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to view and edit CSV files";
    platforms = lib.platforms.unix;
  };
}
