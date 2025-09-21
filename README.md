# NixOS Configuration

## Overview

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
