{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "htmlentify";
  version = "20251018";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "864cd1fd27dbd30cd08dc38fe947e6434d280d96";
    hash = "sha256-pqkjGVnvaIfiycYClmg3t7tG/y8fCaF3kYEtY0sp9Z0=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/htmlentify";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to convert text to HTML entities";
    platforms = lib.platforms.unix;
  };
}
