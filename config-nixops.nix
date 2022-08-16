{
  webserver =
    { config, pkgs, ... }:
    { deployment.targetHost = "<tailscale ip>";
    imports = [
    ./server.nix
    ];
    };
}
