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
    let overlay = final: prev: {
          haskellPackages = prev.haskellPackages.override {
              overrides = haskellSelf: haskellSuper: {
                Agda = prev.haskellPackages.callPackage ./cabal.nix { agda = agda.outPath; };
              };
            };
        };
        overlays = [ overlay ];
        pkgs = import nixpkgs { inherit system overlays; };
    in rec
    {
      packages.agda = pkgs.agda;
      defaultPackage = packages.agda;
    }
  );
}
