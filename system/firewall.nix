{ ... }:

{
networking.firewall = {
  enable = true;
  #allowedTCPPorts = [ 22 80 8096 ];
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
