{ ... }:
{
home.file = {
  ".config/nvim" = {
  source = pkgs.fetchFromGitHub {
     owner = "NvChad";
     repo = "NvChad";
     rev = "86b3b6e";
     sha256 = "sha256-XsJ2hHoQGoDbM7J+VvO1u0+f+jJCQqcUqQjzvTlnnG0=";
  };
  recursive = true;
};
};
}
