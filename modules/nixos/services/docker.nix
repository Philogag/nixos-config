{ virtualisation, username, ... }: 
{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
  users.extraGroups.docker.members = [username];
}
