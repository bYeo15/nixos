{ lib }:
    field: tags: set:
        # Extract field "field" from v
        lib.mapAttrs (n: v: v."${field}") (
            # Select only attrsets where at least one of the provided tags is present
            lib.filterAttrs (n: v:
                lib.any (tag: builtins.elem tag tags) v.tags
            ) set
        )
