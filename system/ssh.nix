{ ... }:
{
services.openssh = {
  enable = true;
#  passwordAuthentication = false; # default true
#  permitRootLogin = "yes";
#  challengeResponseAuthentication = false;

};
# ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA8LsOat1HG1DN6H9XUGyyVIqysS3vZxtfaO2nLEXeaf 
#users.users.ssh = {
  #isNormalUser = true;
  #home  = "/home/ssh";
  #description  = "user to log in with ssh";
  #extraGroups = [ "wheel" ];
 #};
#users.users."ssh".openssh.authorizedKeys.keys = [
  #"AAAAB3Nz....6OWM= user" # content of authorized_keys file
  # note: ssh-copy-id will add user@clientmachine after the public key
  # but we can remove the "@clientmachine" part
#];
}
