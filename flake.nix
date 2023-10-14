{
  inputs = {
    nixpkgs.url = "nixpkgs";
  };

  # nix flake show
  # nix build .#PKG
  # nix log .#PKG
  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      cmd = nixpkgs.legacyPackages.${system};
      build = pkg: cmd.callPackage ./${pkg} {};
    in {
      packages.x86_64-linux.s-nail = build "s-nail";
      packages.x86_64-linux.wifycon = build "wifycon";
      packages.x86_64-linux.yss = build "yss";
  };
}
