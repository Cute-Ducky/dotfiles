{
  webserver =
    { config, pkgs, ... }:
    { deployment.targetHost = "100.72.219.114";
    imports = [
    ./server.nix
    ];
    };
}
