# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{
  pkgs,
  ...
}:

{

  environment.systemPackages = with pkgs; [
    clang
    neovim
    tree-sitter
    tree
    zsh
    starship
    tmux
    stow
    git
    fzf
    zoxide
    fd
    libxml2 # provide xmllint tool
    lazygit
    luajitPackages.luarocks-nix
    lua-language-server
    stylua
    ripgrep
    yaml-language-server
    #docker-language-server
    #bash-language-server
    nodejs_24
    #python314
    nodePackages.prettier
    unzip
    nil
    statix
    codex
    wsl-open
    #    vtsls
  ];

  programs.neovim = {
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.zsh.enable = true;

  environment.shells = [ pkgs.zsh ];

  environment.shellAliases = {
    gs = "git status";
    ll = "ls -l";
    l = "ls -alh";
    xdg-open = "wsl-open";
  };

  users.defaultUserShell = pkgs.zsh;

  users.users.nixos = {
    shell = pkgs.zsh;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
