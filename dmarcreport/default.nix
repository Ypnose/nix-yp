{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "dmarcreport";
  version = "20250930";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "89af542b73e88568d8e26b23b6817373c2c74482";
    hash = "sha256-kkoYJbdy5QNPWqP60RLLHyzZVVD22CcHrWfODxBj/IQ=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/dmarcreport";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to display DMARC reports";
    platforms = lib.platforms.unix;
  };
}
