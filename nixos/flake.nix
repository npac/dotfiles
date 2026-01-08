{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.default
          {
            # This value determines the NixOS release from which the default
            # settings for stateful data, like file locations and database versions
            # on your system were taken. It's perfectly fine and recommended to leave
            # this value at the release version of the first install of this system.
            # Before changing this value read the documentation for this option
            # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
            system.stateVersion = "25.05"; # Did you read the comment?system.stateVersion = "25.05";
            wsl.enable = true;
            wsl.defaultUser = "nixos";
            time.timeZone = "America/Los_Angeles";
          }
          ./configuration.nix
          ./certificates.nix
        ];
      };
    };
  };
}


# {
#   description = "A very basic flake";
#
#   inputs = {
#     nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
#     nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
#   };
#
#   outputs = { self, nixpkgs, nixos-wsl, ... }: 
#     let
#        lib = nixpkgs.lib;
#     in {
#       nixosConfigurations = {
#         nixos = lib.nixosSystem {
#             system = "x86_64-linux";
#             modules = [ 
#               nixos-wsl.nixosModules.default
#               {
#                 system.stateVersion = "25.05";
#                 wsl.enable = true;
#               }
#               ./configuration.nix 
#             ];
#         };
#       };
#     };
# }
