{ config, pkgs, ... }:
{
  programs.home-manager.enable = true;
  ...    # More of your home-manager config

  programs = {
    ...    # Start of your programs config

    vscode = {
      enable = true;
      package = pkgs.vscodium;    # You can skip this if you want to use the unfree version
      extensions = with pkgs.vscode-extensions; [
        # Some example extensions...
        dracula-theme.theme-dracula
        vscodevim.vim
        yzhang.markdown-all-in-one
      ];
    }

    ...    # Rest of your programs config
  }

  ...    # Rest of your home-manager config
}
