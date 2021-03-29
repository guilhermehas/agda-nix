{
  description = "Agda flake";

  inputs = {
    flake-utils.url = github:numtide/flake-utils;
    agda = {
      url = github:agda/agda;
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, agda }:
    flake-utils.lib.eachDefaultSystem (system:
    let pkgs = import nixpkgs { inherit system; };
    in rec
    {
      packages.agda = pkgs.callPackage ./package.nix { agda = agda.outPath; };
      defaultPackage = packages.agda;
    }
  );
}
