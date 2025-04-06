{ pkgs, language ? "js", ... }: {
  packages = [
    pkgs.nodejs_20
  ];
  bootstrap =
    ''
      mkdir "$out"
      if [ "${language}" == "ts" ]; then
        shopt -s dotglob
        cp -r ${./monorepo-ts}/* "$out"
      else
        shopt -s dotglob
        cp -r ${./monorepo}/* "$out"
      fi
      chmod -R +w "$out"
    '';
}
