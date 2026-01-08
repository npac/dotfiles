# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    clang
    neovim
    tree-sitter
    tree
    zsh
    tmux
    stow
    git
    fzf
    zoxide
    fd
    lazygit
    luajitPackages.luarocks-nix
    lua-language-server
    stylua
    ripgrep
    gopls
    yaml-language-server
    typescript-language-server
    docker-language-server
    bash-language-server
    go
    nodejs_24
    python314
    nodePackages.prettier
    unzip
];


  # security.pki.certificateFiles = [
  #   ./zscaler.crt
  # ];
  #
  programs.neovim = {
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.zsh.enable=true;

  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;

  users.users.nixos = {   
    shell = pkgs.zsh;
  };
}
