with (import <nixpkgs> {});

mkShell {
  name = "aspell-env";
  buildInputs = [
    (aspellWithDicts (d: [d.en]))
    jre
    languagetool
    editorconfig-core-c
    texlab
    (texlive.combine { inherit (texlive) scheme-small wrapfig capt-of preview import enumitem; })
  ];
  paths = [aspell aspellDicts.en];
}
