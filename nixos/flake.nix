{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }: 
    let
       lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
            system = "x86_64-linux";
            modules = [ 
              nixos-wsl.nixosModules.default
              {
                system.stateVersion = "25.05";
                wsl.enable = true;
              }
              ./configuration.nix 
            ];
        };
      };
    };
}
