with (import <nixpkgs> {});

mkShell {
  name = "aspell-env";
  buildInputs = [
    (aspellWithDicts (d: [d.en]))
    jre
    languagetool
    editorconfig-core-c
    texlab
    texlive.combined.scheme-full
  ];
  paths = [aspell aspellDicts.en];
}
