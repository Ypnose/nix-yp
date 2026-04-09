{ lib
, stdenv
, fetchFromGitHub
, nextvi
}:

stdenv.mkDerivation rec {
  pname = "nextvi";
  version = "4.2";

  src = fetchFromGitHub {
    owner = "kyx0r";
    repo = "nextvi";
    rev = version;
    hash = "sha256-pkVUCWWVzPwPEG4NGWOoHrXkQpC245kD/Xbj9wmxR3E=";
  };

  nativeBuildInputs = [ nextvi ];

  patchPhase = ''
    export VI=nextvi
    ./arrowkeys_insert.sh
    ./arrowkeys_normal.sh
    ./stdin_pipe.sh
  '';

  dontConfigure = true;

  buildPhase = ''
    ./cbuild.sh
  '';

  installPhase = ''
    PREFIX="$out" ./cbuild.sh install
  '';

  meta = with lib; {
    description = "A small vi/ex terminal text editor";
    homepage = "https://github.com/kyx0r/nextvi";
    license = licenses.mit;
    platforms = platforms.unix;
    mainProgram = "nextvi";
  };
}
