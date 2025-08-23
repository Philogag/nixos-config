{ pkgs, username, ...}:
{
  users.users.${username} = {
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
}
