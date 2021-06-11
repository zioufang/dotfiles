# https://qutebrowser.org/doc/help/commands.html
config.bind('x', 'tab-close')
config.bind('<ctrl+u>', 'undo')
config.bind('d', 'scroll-page 0 0.5')
config.bind('u', 'scroll-page 0 -0.5')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('tt', 'config-cycle statusbar.show always in-mode ;; config-cycle tabs.show always switching')
config.set("colors.webpage.darkmode.enabled", True)

c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'
c.statusbar.show = "in-mode"
c.tabs.show = "switching"
c.auto_save.session = True
c.session.lazy_restore = True
