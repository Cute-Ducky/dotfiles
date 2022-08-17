{ config, pkgs, ... }:
{
   # make the tailscale command usable to users
  environment.systemPackages = [ pkgs.tailscale ];

  # enable the tailscale service
  services.tailscale.enable = true;

networking.firewall = {
    # always allow traffic from your Tailscale network
    trustedInterfaces = [ "tailscale0" ];

    # allow the Tailscale UDP port through the firewall
    allowedUDPPorts = [ config.services.tailscale.port ];
    interfaces."tailscale0".allowedTCPPorts = [ 80 8080 ];

   
   checkReversePath = "loose";
   };

}
