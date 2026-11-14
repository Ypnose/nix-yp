{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  pname = "openbsd-ed";
  version = "0.6";

  src = fetchFromGitHub {
    owner = "Ypnose";
    repo = "openbsd-ed";
    rev = "1cbf408584e430915ca91c272db4b1462817695f";
    hash = "sha256-g2U1ZV05BCf4o/6YChx8LF/HoOj17gBsU/DyUxwqmpw=";
  };

  strictDeps = true;
  dontConfigure = true;

  installPhase = ''
    runHook preInstall

    install -Dm 0755 ed "$out/bin/ed"

    runHook postInstall
  '';

  meta = {
    description = "Line-oriented text editor";
    homepage = "https://www.openbsd.org/";
    platforms = lib.platforms.linux;
    license = lib.licenses.isc;
    mainProgram = "ed";
  };
}
