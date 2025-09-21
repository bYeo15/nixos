# Modules

## `netconn`

Provides configuration options for networks (using NetworkManager `ensureProfiles` style `attrset`s).

`netconn` provides an `attrset` of networks. Each one consists of;

```
profile [attrset] : ensureProfiles style attrset of network configuration
tags [list<str>] : list of tags used to identify the kind of network (used when filtering)
```


## `sshconn`

Provides configuration options for ssh (using SSH `matchBlocks` style `attrset`s).

`sshconn` provides an `attrset` of connections. Each one consists of;

```
block [attrset] : matchBlocks style attrset of connection configuration
tags [list<str>] : list of tags used to identify the kind of connection (used when filtering)
```


## `renix`

`renix.nix` describes a collection of themes for a user's environment, with each theme described as the following;

```
fontMono [str] : the monospace font to use
fontSerif [str] : the serif font to use
fontSans [str] : the sans-serif font to use

colour [attr] : 2-bit colour palette
    mainBG [str] : rrggbb hex colour to use for text background
    main [str] : rrggbb hex colour to use for text
    accentBG [str] : rrggbb hex colour to use for accents/emphasis background
    accent [str] : rrggbb hex colour to use for accents/emphasis

termColour [attr] : 2-bit colour palette for terminals
    mainBG [str] : 256 terminal colour to use for text background
    main [str] : 256 terminal colour to use for text
    accentBG [str] : 256 terminal colour to use for accents/emphasis background
    accent [str] : rrggbb hex colour to use for accents/emphasis

resources [attr] : resources associated with this theme
    background [path] : path to a background image
    fragment [path] : path to a background fragment shader
    helixBase [str] : the `helix` theme to use as a base for customisation
    * [*] : arbitrary additional theme data can be provided
```

Named themes are provided in the attrset `config.renix.themes`. The theme to be currently used is provided in
`config.renix.activeTheme`.


## `bluedev`

Provides options for bluetooth device management.

Each device is described as;

```
name [str] : the name to use for the device in commands
mac [str] : the MAC address of the device
```

and devices are provided as attributes in a tagged `attrset`.
