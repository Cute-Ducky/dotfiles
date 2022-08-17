{ ... }:

{
networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 22 ];
####################################
#  allowedUDPPortRanges = [        #
#    { from = 1714; to = 1764; }   #
#  ];                              #
#  allowedTCPPortRanges = [        #
#    { from = 1714; to = 1764; }   #
#  ];                              #
####################################

   };
}
