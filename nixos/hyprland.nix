{ inputs, pkgs, ... }:
{
  services.xserver = {
    displayManager.startx.enable = true;
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  security = {
    polkit.enable = true;
  };

environment.systemPackages = with pkgs; [
   kitty                                  # to get started with hyprland hit super+Q
   fish                                   # for you standard user
   cargo                                  #
   rustup                                 #
   nodejs_21                              #
   nerdfonts                              #
   node2nix                               #
   gcc                                    #
   clang                                  #
   ccls                                   #
   zig                                    #
   cccc                                   #
   cc65                                   #
   cl                                     #
   freetube                               #
   neofetch                               #
   firefox                                #
   lolcat                                 #
   gh                                     #
   gitui                                  #
   gitty                                  #
   ventoy-bin                             #
   gitea                                  #
   git-up                                 #
   gittyup                                #
   ghr                                    #
   gitg                                   #
   git-doc                                #
   ghq                                    #
   zellij                                 #
   tmux                                   # when your kinda based
   swaybg                                 #
   waypaper                               #
   vim                                    # I use vim btw
   foot                                   #
   zsh                                    # for your average poweruser
   oil                                    # for based af people :dead:
   slurp                                  # the screenshop to your clipboard
   wl-clipboard                           #
   brightnessctl                          #
   gjs                                    #
   gobject-introspection                  #
   unzip                                  #
   grim                                   #
   emacs                                  # doomemacs coming soon (insert tm here)
   fuzzel                                 #
   github-desktop                         #
   git-lfs                                #
   libsForQt5.kate                        #
   libsForQt5.kdeconnect-kde              #
   gnome.adwaita-icon-theme               #
   gnome.nautilus                         #
   gnome.baobab                           #
   gnome.gnome-calendar                   #
   gnome.gnome-boxes                      # me too yeah
   gnome.gnome-system-monitor             #
   gnome.gnome-control-center             #
   gnome.gnome-weather                    #
   gnome.gnome-calculator                 # numbers go here btw
   gnome.gnome-software                   # for flatpak
  ];

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  services = {
    gvfs.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    accounts-daemon.enable = true;
    gnome = {
      evolution-data-server.enable = true;
      glib-networking.enable = true;
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = true;
    };
  };
}
