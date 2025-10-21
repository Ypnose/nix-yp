{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "csvview";
  version = "20251021";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "9f603ec8ffae56bb6b3b7c4b0093cf7126b1cd19";
    hash = "sha256-At8WwuOOCw0NFCKTu+G5rWNv7m2HtAFAnV6WDATcz+M=";
  };

  vendorHash = "sha256-ew4OejtBoLuAnT2GbQWKSbvO9efLw/BUKfhSmX4y7c0=";

  sourceRoot = "${src.name}/csvview";

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to view and edit CSV files";
    platforms = lib.platforms.unix;
  };
}
