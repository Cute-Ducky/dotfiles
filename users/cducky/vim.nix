{  config, pkgs, ... }:
{
home.file = {
  ".config/nvim" = {
  source = pkgs.fetchFromGitHub {
     owner = "NvChad";
     repo = "NvChad";
     rev = "7b683ea";
     sha256 = "sha256-MCOaXZA0kQu4bTCeX5uatgfKBf3DBZ8j2LkpsOBOaPY=";
  };
  recursive = true;
};
};
}
