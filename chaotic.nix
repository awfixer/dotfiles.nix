{ config, ... }:
{
  description = "My configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = { nixpkgs, chaotic, ... }: {
    nixosConfigurations = {
      hostname = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix # Your system configuration.
          chaotic.nixosModules.default # OUR DEFAULT MODULE
        ];
      };
    };
  };
}
#
#{ config, ... }:
#{
#  # asusctl
#  services.asusd = {
#    enable = true;
#    enableUserService = true;
#  };
#
#  # nvidia
#  hardware.opengl = {
#    enable = true;
#    driSupport = true;
#    driSupport32Bit = true;
#  };
#
#  services.xserver.videoDrivers = ["nvidia"];
#
#  hardware.nvidia = {
#    prime = {
#      offload.enable = true;
#      offload.enableOffloadCmd = true;
#      nvidiaBusId = "PCI:1:0:0";
#      amdgpuBusId = "PCI:6:0:0";
#    };
#
#    modesetting.enable = true;
#
#    powerManagement = {
#      enable = true;
#      finegrained = true;
#    };
#
#    open = true;
#    nvidiaSettings = false; # gui app
#    package = config.boot.kernelPackages.nvidiaPackages.latest;
#  };
#}
#
