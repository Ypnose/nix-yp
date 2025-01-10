{ lib
, stdenv
, fetchurl
, ncurses
, db
}:

stdenv.mkDerivation rec {
  pname = "nvi";
  version = "1.81.6";

  src = fetchurl {
    url = "https://deb.debian.org/debian/pool/main/n/nvi/nvi_${version}.orig.tar.gz";
    hash = "sha256-i8NIiJFZo0zyaPgHILJvRZ29cjtWFhB9NnOdAH5Ml40=";
  };

  patches = [
    ./nvi-03-db4.patch
    ./nvi-04-confdefs.patch
    ./nvi-06-default_value_escapetime.patch
    ./nvi-07-flush_cache.patch
    ./nvi-08-lfs.patch
    ./nvi-08-safe_printf.patch
    ./nvi-08-tempfile_umask.patch
    ./nvi-09-casting.patch
    ./nvi-10-no_one_line_visual.patch
    ./nvi-11-backward_sentence_moving.patch
    ./nvi-12-horiz_scroll_count.patch
    ./nvi-13-widechar_horrors.patch
    ./nvi-14-private_regex_fixes.patch
    ./nvi-15-search_word.patch
    ./nvi-18-dbpagesize_binpower.patch
    ./nvi-19-include_term_h.patch
    ./nvi-20-glibc_has_grantpt.patch
    ./nvi-21-exrc_writability_check.patch
    ./nvi-23-debian_alternatives.patch
    ./nvi-24-fallback_to_dumb_term.patch
    ./nvi-26-trailing_tab_segv.patch
    ./nvi-27-support_C_locale.patch
    ./nvi-29-file_backup.patch
    ./nvi-30-regex-character-class.patch
    ./nvi-31-64bit-int-crash.patch
    ./nvi-39-add-function-prototypes-to-fix-implicit-function-dec.patch
    ./nvi-40-add-more-function-prototypes-to-fix-Wimplicit-functi.patch
    ./nvi-50-nvi-o_path.patch
  ];

  buildInputs = [ ncurses db ];

  preConfigure = ''
    cd dist
  '';
  configureFlags = [
    "--enable-widechar"
    "--disable-shared"
    "vi_cv_path_preserve=/tmp"
  ];

  installPhase = ''
    install -Dm 0755 vi $out/bin/vi
  '';

  meta = with lib; {
    description = "The Berkeley Vi Editor";
    license = licenses.free;
    platforms = platforms.unix;
  };
}
