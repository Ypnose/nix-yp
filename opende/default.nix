{ lib
, stdenv
, fetchFromGitHub
, cmake
, pkg-config
, makeBinaryWrapper
, alsa-lib
, libdecor
, libdrm
, libffi
, libglvnd
, libpulseaudio
, libx11
, libxcb
, libxcursor
, libxext
, libxi
, libxkbcommon
, libxrandr
, libxscrnsaver
, wayland
, wayland-scanner
, wayland-protocols
}:

let
  runtimeLibs = [
    alsa-lib
    libdecor
    libdrm
    libffi
    libglvnd
    libpulseaudio
    libx11
    libxcb
    libxcursor
    libxext
    libxi
    libxkbcommon
    libxrandr
    libxscrnsaver
    wayland
    wayland-protocols
  ];
in
stdenv.mkDerivation (finalAttrs: {
  pname = "opende";
  version = "1.0.4";

  src = fetchFromGitHub {
    owner = "jarmitage99";
    repo = "OpenDE";
    tag = finalAttrs.version;
    hash = "sha256-FrSzRJgQjyoCN1WhlvKys2qBEibBt1aBVecQqYzrPbk=";
  };

  strictDeps = true;

  cmakeFlags = [
    (lib.cmakeFeature "CMAKE_BUILD_TYPE" "Release")
    (lib.cmakeBool "SKIP_QA" true)
  ];

  nativeBuildInputs = [
    cmake
    pkg-config
    makeBinaryWrapper
    wayland-scanner
  ];

  buildInputs = runtimeLibs;

  doCheck = true;
  checkPhase = ''
    runHook preCheck

    ./bin/unit-tests "~[data]"

    runHook postCheck
  '';

  installPhase = ''
    runHook preInstall

    install -Dm 0755 ./bin/deusex "$out/bin/deusex"
    install -Dm 0755 ./bin/deused "$out/bin/deused"
    install -Dm 0755 ./bin/ucc "$out/bin/ucc"

    for bin in deusex deused; do
      wrapProgram "$out/bin/$bin" \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath runtimeLibs}"
    done

    runHook postInstall
  '';

  meta = {
    description = "Cross-platform open source reimplementation of Deus Ex";
    homepage = "https://github.com/jarmitage99/OpenDE";
    platforms = lib.platforms.unix;
    license = lib.licenses.mit;
    mainProgram = "deusex";
  };
})
