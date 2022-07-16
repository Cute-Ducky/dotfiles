{ ... }:

{
networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 22 ];
  allowedUDPPortRanges = [
    { from = 1714; to = 1764; }
  ];
  allowedTCPPortRanges = [
    { from = 1714; to = 1764; }
  ];

    # always allow traffic from your Tailscale network
    trustedInterfaces = [ "tailscale0" ];

    # allow the Tailscale UDP port through the firewall
    allowedUDPPorts = [ config.services.tailscale.port ];

    # allow you to SSH in over the public internet
    allowedTCPPorts = [ 22 ];
  };
}
