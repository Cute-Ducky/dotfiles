{ pkgs, ... }:
{
   environment.systemPackages = with pkgs; [
   git
   go-task
   neovim
];
}
