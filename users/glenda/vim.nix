{  config, pkgs, ... }:
{
home.file = {
  ".config/nvim" = {
  source = pkgs.fetchFromGitHub {
     owner = "NvChad";
     repo = "NvChad";
     rev = "86b3b6e";
     sha256 = "sha256-f70ymAwIRI4Xz9R8YfA16PBOX6ZgJzZ9FBa9LezSlwc=";
  };
  recursive = true;
};
};
}
