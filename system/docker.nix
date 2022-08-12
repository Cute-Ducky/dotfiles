{ pkgs, ... }:
{
   virtualisation.docker.enable = true;
   #virtualisation.docker.enable = false;
   #virtualisation.podman.enable = true;
   #virtualisation.podman.dockerSocket.enable = true;
   #virtualisation.podman.defaultNetwork.dnsname.enable = true;
}
