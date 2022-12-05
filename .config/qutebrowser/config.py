config.load_autoconfig()
# https://qutebrowser.org/doc/help/commands.html

# Keybinds
config.bind('<alt-x>', 'set-cmd-text :')
config.bind('t', 'set-cmd-text -s :tab-select')
config.bind('x', 'tab-close')
config.bind('<ctrl-u>', 'undo')
config.bind('j', 'scroll-page 0 0.2')
config.bind('k', 'scroll-page 0 -0.2')
config.bind('d', 'scroll-page 0 0.7')
config.bind('u', 'scroll-page 0 -0.7')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('T', 'tab-focus last')
config.bind('gI', 'hint inputs')
config.bind('f', 'hint all tab')
config.bind('F', 'hint')
config.bind('sr', 'set-cmd-text -s :open -t rust') # search for 'rust'

config.bind('<ctrl-n>', 'completion-item-focus --history next', mode='command')
config.bind('<ctrl-p>', 'completion-item-focus --history prev', mode='command')
config.bind('<up>', 'command-history-prev', mode='command')
config.bind('<down>', 'command-history-next', mode='command')

## config toggle
config.bind('cb', 'config-cycle -t window.hide_decoration false true') # toggle top bar
config.bind('cs', 'config-cycle -t scrolling.bar always never') # toggle scroll bar

## quick input
config.bind(',e', 'insert-text ziou.fang@swift-nav.com') # toggle scroll bar

# Appearance
c.colors.webpage.darkmode.enabled = True

c.window.hide_decoration = False
c.scrolling.bar = "never"
c.statusbar.show = "in-mode"
c.fonts.statusbar = '16pt default_family'

c.completion.height = "30%"
c.completion.shrink = True

c.fonts.hints = '12pt default_family'

## tabs
c.tabs.position = "bottom"
c.fonts.tabs.selected = '14pt default_family'
c.fonts.tabs.unselected = '14pt default_family'
c.colors.tabs.even.bg = "#2b2b2b"
c.colors.tabs.odd.bg = "#323232"
c.colors.tabs.selected.even.fg = "#fdee48"
c.colors.tabs.selected.odd.fg = "#fdee48"
c.tabs.background = True

# Function
c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
    'sw': 'https://github.com/search?q=org%3Aswift-nav+{}',
}

## enable copy
config.set('content.javascript.can_access_clipboard', True, 'github.com')

## ad blocking
c.content.blocking.method = "both" # need: pip3 install adblock
c.content.blocking.enabled = True
#// disable adblock for individual sites for performance
config.set('content.blocking.enabled', False, 'https://github.com/*')
config.set('content.blocking.enabled', False, 'https://*.github.com/*')
config.set('content.blocking.enabled', False, 'https://*.atlassian.net/*')
config.set('content.blocking.enabled', False, 'https://*.aws.amazon.com/*')
config.set('content.blocking.enabled', False, 'https://*.swift-nav.com/*')

c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'
c.auto_save.session = True
c.session.lazy_restore = True
c.messages.timeout = 500 # shorter error message duration
