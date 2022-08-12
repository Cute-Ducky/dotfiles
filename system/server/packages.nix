{ pkgs, ... }:
{
   environment.systemPackages = with pkgs; [
   arion
   docker-client
   git
   go-task
   neovim
];
}
