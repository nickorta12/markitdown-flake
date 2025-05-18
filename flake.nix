{
  description = "Flake for MarkItDown tool by Microsoft";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "/nix/store/126fp22lvqmnfv1p290vcpmbf8yab4a5-source";

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        inherit (pkgs.python3.pkgs) callPackage;
        mammoth = callPackage ./mammoth.nix { };
      in
      {
        packages = rec {
          markitdown = callPackage ./markitdown.nix { inherit mammoth; };
          default = markitdown;
        };
        apps = rec {
          markitdown = flake-utils.lib.mkApp { drv = self.packages.${system}.markitdown; };
          default = markitdown;
        };
      }
    );
}
