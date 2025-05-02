{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "printerinfo";
  version = "20250502";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "9d5dd83abf65c5c06b88dcac4cd9f245944630c2";
    hash = "sha256-yiumfIClrlPbZImv8EpreCMoCcEd5Zt2xf/0TbgXgOA=";
  };

  vendorHash = "sha256-LC80ez4cnZ+ssBdoNe3OSnvc5SSrq+1wJDvBUjtIcqc=";

  sourceRoot = "${src.name}/printerinfo";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to show printer info using SNMP";
    platforms = lib.platforms.unix;
  };
}
