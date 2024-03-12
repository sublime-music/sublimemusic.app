{
  description = "Mines HSPC Website";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    (flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { system = system; };
      in {
        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              gnumake
              nodePackages.html-minifier
              nodePackages.uglify-js
              sass
            ];
          };
        };
      }));
}
