# NixOS Configuration

## Layout

```
~/.nixconf/
|
|--< flake.nix          # Main flake, has outputs for each host and user
|
|
|--[ hosts/             # Per-device configurations
|  |
|  |--[ <host>/         # The configuration for a given host device
|  |
|  |--[ modules/        # Modules providing host-level options
|
|
|--[ users/             # Per-user configurations
|  |
|  |--[ <name>/         # The configuration for a given user (Home-Manager)
|  |  |
|  |  |--< user.nix     # The user declaration to be imported by the host(s) that include this user
|  |
|  |--[ modules/        # Modules providing user-level options
|
|
|--[ modules/           # Provides config agnostic option modules (data only)
|
|
|--[ utils/             # Provides config utilities, often associated with modules
|
|
|--[ secrets -> *       # Git submodule that provides all secret values
|  |                    # and encrypted agenix secrets
|  |                    # Includes secret realisations of modules
|  |
|  |--[ agenix/         # Age encrypted secret files
|  |
|  |--[ config/         # Any configuration files containing sensitive information (typically
                        # realisations of options provided in modules)
```


## Organisation

This config is designed to be user (managed through `home-manager`) first.
Users should be host-agnostic, while hosts can be specifically configured to match user profiles.


## Users

### `ben`

The main user, only non-headless user.

`sway` desktop & general pool of tools.


### `gaming`

Gaming user running headless X11. Acts as host for Steam Remote Play.



## Future

- Greater use of host/user-level modules to reduce duplication
  - See `nixpad` & `nixbook` for high level of duplication
- Bluetooth secrets + `device -> alias` utilty
