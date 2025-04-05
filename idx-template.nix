{ pkgs, typescript ? false, ... }:{
  packages = [
    pkgs.nodejs_20
  ];
  bootstrap =
    ''
      cp -rf ${./monorepo}${if typescript then "-ts" else ""} "$WS_NAME"
      chmod -R +w "$WS_NAME"
      mv "$WS_NAME" "$out"
    '';
}
