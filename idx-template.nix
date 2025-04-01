{ pkgs, typescript ? false, ... }: {
  packages = [
    pkgs.nodejs_20
  ];
  bootstrap = ''
    mkdir "$out"
    mkdir -p "$out/.idx/" "$out/client" "$out/server"
    cp -rf ${./dev.nix} "$out/.idx/dev.nix"
    if [ "$typescript" = "true" ]; then
      shopt -s dotglob; cp -r ${src}/monorepo-ts/client/* "$out/client"
      shopt -s dotglob; cp -r ${src}/monorepo-ts/server/* "$out/server"
    else
      shopt -s dotglob; cp -r ${./monorepo/client}/* "$out/client"
      shopt -s dotglob; cp -r ${./monorepo/server}/* "$out/server"
    
    chmod -R +w "$out"
  '';
}