{
  description = "Unofficial Hochschule Fulda beamer theme";

  inputs.nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (
        pkgs:
        let
          tex = pkgs.texliveMedium.withPackages (
            ps: with ps; [
              latexmk
              fira
              firamath
            ]
          );
        in
        {
          default = pkgs.mkShellNoCC {
            packages = [
              tex
              pkgs.gnumake
            ];
          };
        }
      );
    };
}
