with (import <nixpkgs> {});

let
  unstable = import
    (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/93184413f2180ce79d53df91df4d43c2e8f931aa.tar.gz)
    { inherit config; };
in
unstable.mkShell {
  name = "aspell-env";
  buildInputs = [
    (pkgs.aspellWithDicts (d: [d.en]))
    unstable.jre
    unstable.languagetool
    unstable.editorconfig-core-c
    unstable.texlab
    (unstable.texlive.combine { inherit (unstable.texlive) scheme-small wrapfig capt-of; })
  ];
  paths = [aspell aspellDicts.en];
}
