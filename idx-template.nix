{ pkgs, typescript ? false, ... }:{
  packages = [
    pkgs.nodejs_20
  ];
  bootstrap =
    ''
      mkdir "$out"
      shopt -s dotglob; cp -r ${./monorepo}/* "$out"
      chmod -R +w "$out"
    '';
}
