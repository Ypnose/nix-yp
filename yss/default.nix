{ lib
, stdenv
, fetchFromGitLab
, makeWrapper
, hostname
, coreutils-full
, gawk
}:

stdenv.mkDerivation {
  pname = "yss";
  version = "20260530";

  src = fetchFromGitLab {
    domain = "framagit.org";
    owner = "Ypnose";
    repo = "yss";
    rev = "90bafc7b68d7dbbd64d098ce9b0b99504e5675ab";
    hash = "sha256-rMZNSKbFsB8E6XU3yb0/VA4iXT0Of6fTUqEEwnrpJrA=";
  };

  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    install -Dm 0755 yss "$out/bin/yss"
    wrapProgram "$out/bin/yss" \
      --prefix PATH : "${lib.makeBinPath [ hostname coreutils-full gawk ]}"

    runHook postInstall
  '';

  meta = {
    description = "Script to display some information about the current system";
    homepage = "https://framagit.org/Ypnose/yss";
    platforms = lib.platforms.linux;
    license = lib.licenses.bsd3;
    mainProgram = "yss";
  };
}
