{
  test-vm = {
    select_host = "test-vm";
    select_profile = "desktop-develop";
    system = "x86_64-linux";
    username = "philogag";
  };
}

# you can add your own instance combination in instance.local.nix which will not tracked by git
# (import ./instance.local.nix or {})
