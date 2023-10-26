{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  pname = "openbsd-ed";
  version = "0.5";

  src = fetchFromGitHub {
    owner = "Ypnose";
    repo = "openbsd-ed";
    rev = "7a3fc10df2d1250de3b732cc033d245fdcbe7f47";
    sha256 = "sha256-eS17jgwSmpfRd1Rqk5x0bsHqVzuzVE5NFfKEoSPeXfM=";
  };

  dontConfigure = true;

  installPhase = ''
    install -Dm 0755 ed $out/bin/ed
  '';

  meta = {
    homepage = "https://www.openbsd.org/";
    description = "Line-oriented text editor";
    platforms = lib.platforms.unix;
  };
}
