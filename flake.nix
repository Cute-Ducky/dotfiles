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
	   	./system/system.nix
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


  };


   

}
