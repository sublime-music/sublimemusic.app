{ pkgs ? import <nixpkgs> {} }: with pkgs;
pkgs.mkShell {
  buildInputs = [
    gnumake
    nodePackages.html-minifier
    nodePackages.uglify-js
    rnix-lsp
    sass
  ];
}
