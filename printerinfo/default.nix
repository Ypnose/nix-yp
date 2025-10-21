{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "printerinfo";
  version = "20251021";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "9f603ec8ffae56bb6b3b7c4b0093cf7126b1cd19";
    hash = "sha256-At8WwuOOCw0NFCKTu+G5rWNv7m2HtAFAnV6WDATcz+M=";
  };

  vendorHash = "sha256-95aTIiAZja0HFdrBq4h9EwzNygBOEWlbjRBXLuXYdm4=";

  sourceRoot = "${src.name}/printerinfo";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to show printer info using SNMP";
    platforms = lib.platforms.unix;
  };
}
