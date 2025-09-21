{ inputs, config, lib, pkgs, ... }:

{
    programs.firefox = {
        enable = true;
        package = pkgs.firefox-wayland;
        profiles = {
            default = {
                id = 0;
                name = "default";
                isDefault = true;
                settings = {
                    # ===[ Browser ]===
                    # -- Search --
                    "browser.search.defaultenginename" = "DuckDuckGo";
                    "browser.search.suggest.enabled" = false;
                    "browser.search.suggest.enabled.private" = false;
                    # -- Contile --
                    "browser.topsites.contile.enabled" = false;
                    # -- URL Bar --
                    "browser.urlbar.suggest.searches" = false;
                    "browser.urlbar.showSearchSuggestionsFirst" = false;
                    # -- New Tab Page --
                    "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
                    "browser.newtabpage.activity-stream.feeds.snippets" = false;
                    "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
                    "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
                    "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
                    "browser.newtabpage.activity-stream.showSponsored" = false;
                    "browser.newtabpage.activity-stream.system.showSponsored" = false;
                    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
                    # -- Download --
                    "browser.download.dir" = "/home/ben/downloads";

                    "extensions.pocket.enabled" = false;
                };
                search = {
                    force = true;
                    default = "ddg";
                    privateDefault = "ddg";
                    # ===[ Custom Searches ]===
                    engines = {
                        "Nixpkg" = {
                            urls = [{
                                template = "https://search.nixos.org/packages";
                                params = [
                                    { name = "type"; value = "packages"; }
                                    { name = "query"; value = "{searchTerms}"; }
                                ];
                            }];
                            definedAliases = [ "@np" ];
                        };
                        "Nixopts" = {
                            urls = [{
                                template = "https://search.nixos.org/options";
                                params = [
                                    { name = "type"; value = "options"; }
                                    { name = "query"; value = "{searchTerms}"; }
                                ];
                            }];
                            definedAliases = [ "@no" ];
                        };
                        "NixWiki" = {
                            urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
                            definedAliases = [ "@nw" ];
                        };
                        "Noogle" = {
                            urls = [{ template = "https://noogle.dev/q?term={searchTerms}"; }];
                            definedAliases = [ "@ng" ];
                        };
                        "HomeManagerOpts" = {
                            urls = [{ template = "https://home-manager-options.extranix.com/?query={searchTerms}"; }];
                            definedAliases = [ "@hm" ];
                        };
                        "Subreddit" = {
                            urls = [{ template = "https://reddit.com/r/{searchTerms}/hot"; }];
                            definedAliases = [ "@rd" ];
                        };
                    };
                };
                bookmarks = {
                    force = true;
                    settings = [
                        # ---=[ Bookmark Toolbar ]=---
                        {
                            name = "Toolbar";
                            toolbar = true;
                            bookmarks = [
                                # ===[ Google Bookmarks ]===
                                {
                                    name = "Google";
                                    bookmarks = [
                                        {
                                            name = "Gmail";
                                            tags = [ "mail" ];
                                            keyword = "gmail";
                                            url = "https://mail.google.com/";
                                        }
                                        {
                                            name = "Drive";
                                            tags = [ "files" ];
                                            keyword = "gdrive";
                                            url = "https://drive.google.com/drive/my-drive";
                                        }
                                    ];
                                }
                                # ===[ USYD Bookmarks ]===
                                {
                                    name = "USYD";
                                    bookmarks = [
                                        {
                                            name = "USYD Portal";
                                            tags = [ "usyd" ];
                                            url = "https://sydneystudent.sydney.edu.au/";
                                        }
                                        {
                                            name = "Canvas";
                                            tags = [ "usyd" ];
                                            keyword = "canvas";
                                            url = "https://canvas.sydney.edu.au/";
                                        }
                                        {
                                            name = "EdStem";
                                            tags = [ "usyd" ];
                                            keyword = "edstem";
                                            url = "https://edstem.org/au/dashboard";
                                        }
                                        {
                                            name = "USYD Timetable";
                                            tags = [ "usyd" ];
                                            url = "https://timetable.sydney.edu.au/odd/student";
                                        }
                                        {
                                            name = "USYD GitHub";
                                            tags = [ "usyd" "git" ];
                                            url = "https://github.sydney.edu.au/";
                                        }
                                    ];
                                }
                                # ===[ UTS Bookmarks ]===
                                {
                                    name = "UTS";
                                    bookmarks = [
                                        {
                                            name = "UTS Apps";
                                            tags = [ "uts" ];
                                            keyword = "uts";
                                            url = "https://login.uts.edu.au/app/UserHome";
                                        }
                                    ];
                                }
                                # ===[ Misc Bookmarks ]===
                                {
                                    name = "Outlook";
                                    tags = [ "usyd" "uts" "mail" ];
                                    url = "https://outlook.office.com/mail/";
                                }
                                {
                                    name = "Wolfram";
                                    tags = [ "util" ];
                                    keyword = "wolfram";
                                    url = "https://www.wolframalpha.com/";
                                }
                                {
                                    name = "regex101";
                                    tags = [ "util" ];
                                    keyword = "regex";
                                    url = "https://regex101.com/";
                                }
                                {
                                    name = "Fistful of Vinyl";
                                    tags = [ "music" ];
                                    keyword = "vinyl";
                                    url = "https://spinitron.com/KXLU/show/190219/A-Fistful-of-Vinyl";
                                }
                                {
                                    name = "Bandcamp";
                                    tags = [ "music" ];
                                    keyword = "bandcamp";
                                    url = "https://bandcamp.com/";
                                }
                            ];
                        }

                        # ---=[ Non-Toolbar Bookmarks ]=---
                        {
                            name = "Quick Links";
                            toolbar = false;

                            bookmarks = [
                                {
                                    name = "GitHub";
                                    tags = [ "git" ];
                                    keyword = "git";
                                    url = "https://github.com/";
                                }
                            ];
                        }
                    ];
                };
                extensions = {
                    force = true;
                    packages = with pkgs.nur.repos.rycee.firefox-addons; [
                        ublock-origin
                    ];
                };
            };
        };
    };
}
