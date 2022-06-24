{ forWebsiteBuild ? false }:
let
  pkgs = import <nixpkgs> { };
in
with pkgs;
pkgs.mkShell {
  buildInputs = [
    gnumake
    nodePackages.html-minifier
    nodePackages.uglify-js
    sass
  ] ++ (lib.lists.optional (!forWebsiteBuild) [
    rnix-lsp
  ]);
}
