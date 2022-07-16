{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: (
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
        bEnv = pkgs.bundlerEnv {
          name = "ruby-env";
          ruby = pkgs.ruby_2_7;
          gemdir = ./.;
        };
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        nativeBuildInputs = [ bEnv ];
      };
    }
  );
}
