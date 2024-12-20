{
  description = "Flake for MarkItDown tool by Microsoft";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = rec {
          markitdown = pkgs.callPackage ./markitdown.nix {};
          default = markitdown;
        };
        apps = rec {
          markitdown = flake-utils.lib.mkApp {drv = self.packages.${system}.markitdown;};
          default = markitdown;
        };
      }
    );
}
