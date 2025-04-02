{ pkgs, typescript ? false, ... }: {
  packages = [
    pkgs.nodejs_20
  ];
  bootstrap = ''
    mkdir "$out"
    mkdir -p "$out/.idx/" "$out/client" "$out/server"
    cp -rf ${./dev.nix} "$out/.idx/dev.nix"
    cp -rf ${./monorepo}${if typescript then "-ts" else ""}/client "$out/client"
    cp -rf ${./monorepo}${if typescript then "-ts" else ""}/server "$out/server"
    chmod -R +w "$out"
  '';
}
