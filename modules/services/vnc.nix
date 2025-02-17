{ services, pkgs, lib, ... }: 

{
  # let lightdm can find xvnc in PATH
  services.displayManager.execCmd = lib.mkForce ''
    export PATH=${pkgs.turbovnc}/bin:${pkgs.lightdm}/sbin:$PATH
    exec ${pkgs.lightdm}/sbin/lightdm
  '';

  environment.systemPackages = with pkgs; [ turbovnc ];
  hardware.opengl.enable = true;

  services.xserver.displayManager.lightdm.extraConfig = ''
    [VNCServer]
    enabled=true
    command=Xvnc
    port=5900
    width=1024
    height=768
    depth=24
  '';
}

