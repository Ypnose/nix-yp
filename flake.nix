{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  # nix build .#PKG
  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      build = pkg: nixpkgs.legacyPackages.${system}.callPackage ./${pkg} {};
    in {
      packages.x86_64-linux.s-nail = build "s-nail";
      packages.x86_64-linux.wifycon = build "wifycon";
      packages.x86_64-linux.yss = build "yss";
  };
}
