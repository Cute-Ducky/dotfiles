{
  description = "My nix system config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";

      # We want home-manager to use the same set of nixpkgs as our system.
      inputs.nixpkgs.follows = "nixpkgs";
    };
};

  outputs = { self, nixpkgs, home-manager }:
  let
     system = "x86_64-linux";

     pkgs = import nixpkgs {
        inherit system;
  config = { allowUnfree = true; };
     };

     lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
  nixos = lib.nixosSystem {
     inherit system;
     modules = [
        #./system/system.nix
./system/hardware-configuration.nix
./system/boot.nix
./system/networking.nix
./system/xorg.nix
./system/packages.nix
./system/zfs.nix
./system/doas.nix
./system/configuration.nix
./system/flash-os/steam.nix
./system/jellyfin.nix
./system/firewall.nix
./system/tainscale.nix

     ];
  };
  flash-os = lib.nixosSystem {
     inherit system;
     modules = [
        ./system/flash-os/system.nix

     ];
  };

};
    homeManagerConfigurations = {
    glenda = home-manager.lib.homeManagerConfiguration  {
    inherit system pkgs;
    username = "glenda";
    homeDirectory = "/home/glenda";
    stateVersion = "22.05";
    configuration = {
    imports = [
    ./users/glenda/home.nix
    ];
    };
    };
    };
    nixosConfigurations.container = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules =
        [
  ./system/container.nix
        ];
    };

  };
}
