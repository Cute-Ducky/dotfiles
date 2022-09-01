{ pkgs, ... }:
{

services.nextcloud = {
  enable = true;
  package = pkgs.nextcloud24;
  hostName = "host_name";
  config.adminpassFile = "${pkgs.writeText "adminpass" "test_123"}";
};
}
