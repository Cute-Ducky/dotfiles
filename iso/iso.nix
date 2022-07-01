{config, pkgs, ...}:
{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    # Provide an initial copy of the NixOS channel so that the user
    # doesn't need to run "nix-channel --update" first.
    ../system/configuration.nix
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];
}
