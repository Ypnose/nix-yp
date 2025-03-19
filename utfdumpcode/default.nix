{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "utfdumpcode";
  version = "20250319";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "83c77a5b6133461032f8b87c892a9a822c197770";
    hash = "sha256-B7nGO5ByqdPTaJBD802CqPle92lfwVYP53uizvcvUiM=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/utfdumpcode";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to dump Unicode code points";
    platforms = lib.platforms.unix;
  };
}
