{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "ipinfo";
  version = "20250624";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "1a5f8febf529d044fa1ecd3c6ef3a2265aa34ae8";
    hash = "sha256-S8oY/9og56FZ8uvIjKuipOMrYvCCeoZC8px+Q7a2k+4=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/ipinfo";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to gather information from IPinfo.io";
    platforms = lib.platforms.unix;
  };
}
