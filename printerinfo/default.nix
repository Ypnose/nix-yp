{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "printerinfo";
  version = "20250214";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "9979b21f7f412658fca6243725b7d9be8db6f5a6";
    hash = "sha256-tF9NbJ/KNJx48EqzvSwBZvXq/NlYl/k/5zGEXuQpnY0=";
  };

  vendorHash = "sha256-wdgDER145dpmZjti+JbRc1n190FebXX/a1sE5kgRCr4=";

  sourceRoot = "${src.name}/printerinfo";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to show printer info using SNMP";
    platforms = lib.platforms.unix;
  };
}
