{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "thermal";
  version = "20250731";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "7b69e2bf920f7b1322c003685cd2ff301dc19e70";
    hash = "sha256-2n1E8ntWnyx0d1OAIJvOQaX/OupAZYFPp+hwG1++NWk=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/thermal";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to display sensors and thermal values";
    platforms = lib.platforms.unix;
  };
}
