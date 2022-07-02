{ config, pkgs, ... }:
{
home.file = {
  ".config/emacs".source = pkgs.fetchFromGitHub {
     owner = "plexus";
     repo = "chemacs2";
     rev = "8683883";
     sha256 = "sha256-XsJ2hHoQGoDbM7J+VvO1u0+f+jJCQqcUqQjzvTlnnG0=";
  };

  ".emacs-profiles.el".text = ''
(("default" . ((user-emacs-directory . "~/.config/emacs-rational"))))
  '';



  ".config/emacs-rational" = {
   source = pkgs.fetchFromGitHub {
     owner = "SystemCrafters";
     repo = "rational-emacs";
     rev = "3c18e6d";
     sha256 = "sha256-YERbThmpD+IRF591glMtE2n0E/IzFoJ+2quZyKK9yx4=";
  };
  recursive = true;
  };
};
}
