# Utils

## `extractAttr`

`extractAttr <attribute [str]> <set [attrs(attribute [*], ...)]>`

Extracts a given attribute from an attribute set of attribute sets.

eg.
```
extractAttr "value" {
    attr1 = { tags = [ "a" "b" ]; value = "a"; };
    attr2 = { tags = [ "b" "c" ]; value = "c"; };
} -> { attr1 = "a"; attr2 = "b"; }
```


## `filterTagged`

`filterTagged <attribute [str]> <tags [list[str]]> <set [attrs(tags [list[str]], attribute [*], ...)]>`

Filters an attribute set of tagged attribute sets for those matching a given set of tags, and then extracts a given attribute from them.

eg.
```
filterTagged "value" [ "a" "c" ] {
    attr1 = { tags = [ "a" "b" ]; value = "a" };
    attr2 = { tags = [ "b" ]; value = "b" };
    attr3 = { tags = [ "b" "c" ]; value = "c" };
} -> { attr1 = "a"; attr3 = "c" };
```
