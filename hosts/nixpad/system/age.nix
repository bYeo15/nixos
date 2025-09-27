{ inputs, config, lib, pkgs, ... }:

{
    age.identityPaths = [ "/etc/ssh/age_secret_access" "/home/ben/.ssh/ben_user_id" ];
}
