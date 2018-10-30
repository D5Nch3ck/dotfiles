-- Global variables for luakit

local globals = {
    homepage            = "https://duckduckgo.com/",
    scroll_step         = 40,
    zoom_step           = 0.1,
    max_cmd_history     = 100,
    max_srch_history    = 100,
    default_window_size = "1000x600",
    vertical_tab_width  = 200,

 -- Disables loading of hostnames from /etc/hosts (for large host files)
 -- load_etc_hosts      = false,
 -- Disables checking if a filepath exists in search_open function
 -- check_filepath      = false,
 -- Specify your preferred terminal emulator
    term                = "urxvtc",
}

-- List of search engines. Each item must contain a single %s which is
-- replaced by URI encoded search terms. All other occurances of the percent
-- character (%) may need to be escaped by placing another % before or after
-- it to avoid collisions with lua's string.format characters.
-- See: http://www.lua.org/manual/5.1/manual.html#pdf-string.format
globals.search_engines = {
    ddg 	= "https://duckduckgo.com/?q=%s",
    gog         = "https://google.com/search?q=%s",
    ix          = "https://ixquick.com/do/search?q=%s",
    gs          = "https://encrypted.google.com/search?q=%s",
    gis         = "https://encrypted.google.com/search?tbm=isch&q=%s",
    wiki        = "https://en.wikipedia.org/wiki/Special:Search?search=%s",
    yt          = "http://www.youtube.com/results?search_query=%s&aq=f",
    github      = "https://github.com/search?q=%s",
    imdb        = "http://imdb.com/find?s=all&q=%s",
    idioms      = "http://idioms.thefreedictionary.com/%s",
    acro        = "http://acronyms.thefreedictionary.com/%s",
    sf          = "http://sf.net/search/?words=%s",
    nyaa        = "http://www.nyaa.eu/?page=search&cats=1_37&filter=0&term=%s",
    tosho       = "http://tokyotosho.info/search.php?terms=%s&type=1&size_min=&size_max=&username=",
    tiny        = "http://www.tineye.com/search?pluginver=bookmark_1.0&url=%s",
}

-- Set google as fallback search engine
globals.search_engines.default = globals.search_engines.duckduckgo
-- Use this instead to disable auto-searching
--search_engines.default = "%s"

-- Per-domain webview properties
-- https://webkitgtk.org/reference/webkit2gtk/stable/WebKitWebView.html
-- https://webkitgtk.org/reference/webkit2gtk/stable/WebKitSettings.html
globals.domain_props = {
    ["all"] = {
        enable_webgl               = false,
        enable_scripts             = false,
        enable_plugins             = false,
        -- zoom_text_only          = true,
		enable_private_browsing	   = true,
    }, --[[
    ["youtube.com"] = {
        enable_scripts = true,
        enable_plugins = true,
    }, ]]
}

-- Cookie acceptance policy
-- Acceptable values: "always", "never", "no_third_party"
soup.accept_policy = "no_third_party"

-- Cookie storage location
-- Remove this line or set to nil to disable cookie persistence
-- soup.cookies_storage = luakit.data_dir .. "/cookies.db"

return globals

-- vim: et:sw=4:ts=8:sts=4:tw=80
