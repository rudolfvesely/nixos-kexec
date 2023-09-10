{ lib, pkgs, config, ... }:

with lib;
{
  boot.loader.grub.enable = false;
  boot.kernelParams = [
    "net.ifnames=0"
    "console=ttyS0,115200"
    "panic=30"
    "boot.panic_on_fail"
  ];
  # boot.supportedFilesystems = [ "zfs" ];
  systemd.services.sshd.wantedBy = [ "multi-user.target" ];
  # users.users.root.openssh.authorizedKeys.keys = [
  #   "<key>"
  # ];
  networking.hostName = "kexec";
  networking = {
    # nameservers = [ ];
    interfaces.eth0 = {
      useDHCP = true;
    };
  };
}
