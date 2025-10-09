{ virtualisation, username, ... }: 
{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  
    daemon.settings = {
      
    };
  };
  users.extraGroups.docker.members = [username];
}
