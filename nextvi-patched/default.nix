{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "nextvi";
  version = "7.8";

  src = fetchFromGitHub {
    owner = "kyx0r";
    repo = "nextvi";
    tag = finalAttrs.version;
    hash = "sha256-heIsBDxCx+DKft6slKDw2YG8AdK887e27WlqrUV87bM=";
  };

  strictDeps = true;
  dontConfigure = true;

  buildPhase = ''
    runHook preBuild

    # Build vanilla nextvi to apply patches and then build "real" binary
    ./cbuild.sh
    printf "%s\n" "==> Applying patches"
    export VI="''${PWD}/vi"
    # Patches
    ./arrowkeys_insert.sh
    ./arrowkeys_normal.sh
    ./stdin_pipe.sh
    printf "%s\n" "==> Patches applied. Building final binary"
    ./cbuild.sh clean
    ./cbuild.sh

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    PREFIX="$out" ./cbuild.sh install

    runHook postInstall
  '';

  meta = {
    description = "A small vi/ex terminal text editor";
    homepage = "https://github.com/kyx0r/nextvi";
    platforms = lib.platforms.unix;
    license = lib.licenses.mit;
    mainProgram = "nextvi";
  };
})
