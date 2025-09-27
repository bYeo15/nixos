{ inputs, config, lib, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        helix

        git
        curl
        wget

        inputs.agenix.packages."${system}".default
    ];
}
