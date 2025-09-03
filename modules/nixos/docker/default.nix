{ pkgs, username, ... }:

{
  config = {
    virtualisation.docker.enable = true;
    virtualisation.podman.enable = true;

    users.users."${username}" = {
      extraGroups = [ "docker" ];
    };
  };
}
