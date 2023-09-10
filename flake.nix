{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  outputs = { self, nixpkgs }: {
    nixosConfigurations =
      {
        kexecTarball = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            "${nixpkgs}/nixos/modules/installer/netboot/netboot-minimal.nix"
            ./configuration.nix
            ./build.nix
          ];
        };
        kexec = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
          ];
        };
      };
  };
}
# nix build .#nixosConfigurations.kexecTarball.config.system.build.kexec_tarball
# rm -rf /tmp/kexec && mkdir /tmp/kexec
# tar -C /tmp/new -xf result/tarball/nixos-system-x86_64-linux.tar.xz
# /tmp/new/kexec_nixos
