{ pkgs, config, ... }: {
  #Home manager configuration
  home.username = "john";
  home.homeDirectory = "/home/john";
  imports = [ ./../../home ]; # ./../../home/nixos ];

  home.packages = with pkgs; [
    synology-drive-client
    spotify
    steam
    libreoffice
    slack
    gimp
    peek
    # neofetch
    htop
    _1password
    gh
    vlc
    # solaar
    # remmina
    signal-desktop
    vscode
    jellyfin-media-player
  ];

  dov = {
    zsh.enable = true;
#    emacs.enable = true;
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.home-manager.enable = true;

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  services.gpg-agent.enable = true;
  programs.gpg.enable = true;

#  programs.mercurial = {
#    enable = true;
#    userName = "Dov Alperin";
#    userEmail = "git@dov.dev";
#  };

#  programs.git = {
#    enable = true;
#    userName = "thethaed";
#    userEmail = "github@johnlundin.se";
#    delta.enable = true;
#    signing = {
#      key = "7F2C07B91B52BB61";
#      signByDefault = true;
#    };
#    extraConfig = {
#      init = {
#        defaultBranch = "main";
#      };
#    };
#  };

#  programs.go = {
#    enable = true;
#    package = pkgs.unstable.go_1_19;
#  };

#  programs.jq = {
#    enable = true;
#  };

  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "x11-randr-fractional-scaling" ];
    };
  };
}
