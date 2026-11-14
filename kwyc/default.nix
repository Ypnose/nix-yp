{ lib
, stdenv
, fetchFromGitLab
, makeWrapper
, gawk
, iproute2
, nftables
}:

stdenv.mkDerivation {
  pname = "kwyc";
  version = "20260530";

  src = fetchFromGitLab {
    domain = "framagit.org";
    owner = "Ypnose";
    repo = "kwyc";
    rev = "db76b476a53014a2c2646091137a585ef342cd4a";
    hash = "sha256-1+p5vokaAs6hZHtFv1kYPqowH/eD8LD8pIgS3beIkf8=";
  };

  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    install -Dm 0755 kwyc "$out/bin/kwyc"
    wrapProgram "$out/bin/kwyc" \
      --prefix PATH : "${lib.makeBinPath [ gawk iproute2 nftables ]}"

    runHook postInstall
  '';

  meta = {
    description = "Script to initiate WireGuard VPN tunnel";
    homepage = "https://framagit.org/Ypnose/kwyc";
    platforms = lib.platforms.linux;
    license = lib.licenses.bsd3;
    mainProgram = "kwyc";
  };
}
