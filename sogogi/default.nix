{ lib
, fetchFromCodeberg
, buildGoModule
}:

buildGoModule rec {
  pname = "sogogi";
  version = "20260411";

  src = fetchFromCodeberg {
    owner = "emersion";
    repo = "sogogi";
    rev = "9188623fe7e6bb8cd5f5491a97c8ff047aceb852";
    hash = "sha256-sdeYmhlOI2tE9a66Y96ICsgGTp611jbdCn2He4/zN1s=";
  };

  vendorHash = "sha256-T2lKckoizZritI8/0Ejtj2CuVCV3Cl3CLtoG/Bdcm2Y=";

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    description = "A simple WebDAV server";
    homepage = "https://codeberg.org/emersion/sogogi";
    platforms = platforms.linux;
    mainProgram = "sogogi";
  };
}
