{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "again";
  version = "20250111";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "24375a7d3e0d1c928e04c1a592bf684fef311b36";
    hash = "sha256-Y4zjoQiTzSQKwW2vdfeF+7SRAp7Rwyx4RsUt4LXFq0U=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/again";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to execute commands repeatedly";
    platforms = lib.platforms.unix;
  };
}
