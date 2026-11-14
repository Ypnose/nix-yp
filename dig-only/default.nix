{ lib
, stdenv
, fetchurl
, pkg-config
, perl
, libidn2
, libtool
, openssl
, libuv
, liburcu
, libcap
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "dig-only";
  version = "9.20.27";

  src = fetchurl {
    url = "https://downloads.isc.org/isc/bind9/${finalAttrs.version}/bind-${finalAttrs.version}.tar.xz";
    hash = "sha256-FFq3pQszoG2dSIteZoyIfnVPQqz4lU4rXcfiOLCA5KA=";
  };

  strictDeps = true;

  nativeBuildInputs = [ pkg-config libtool perl ];
  buildInputs = [ libidn2 openssl libuv liburcu libcap ];

  configureFlags = [
    "--localstatedir=/var"
    "--disable-chroot"
    "--disable-dnsrps"
    "--disable-doh"
    "--disable-fips-mode"
    "--disable-full-report"
    "--disable-linux-caps"
    "--disable-static"
    "--disable-tcp-fastopen"
    "--with-libidn2"
    "--without-gssapi"
    "--without-json-c"
    "--without-lmdb"
    "--without-libnghttp2"
    "--without-readline"
    "--without-zlib"
  ];

  makeFlags = [ "-C" "lib" ];
  enableParallelBuilding = true;

  postInstall = ''
    make -C bin/dig install
    # Headers not needed
    rm -r "$out/include/"
  '';

  meta = {
    homepage = "https://www.isc.org/bind/";
    description = "dig & other utils from BIND";
    platforms = lib.platforms.unix;
    license = lib.licenses.mpl20;
    mainProgram = "dig";
  };
})
