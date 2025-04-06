{ pkgs, typescript ? false, ... }: {
  packages = [
    pkgs.nodejs_20
  ];
  bootstrap =
    ''
      mkdir "$out"
      if [ "${typescript}" == "true" ]; then
        shopt -s dotglob
        cp -r ${./monorepo-ts}/* "$out"
      else
        shopt -s dotglob
        cp -r ${./monorepo}/* "$out"
      fi
      chmod -R +w "$out"
    '';
}
