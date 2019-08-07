## DEBIAN BASED
sudo apt-get install -y i3 i3status

# https://github.com/addy-dclxvi/i3-starterpack
# compton:		desktop effects like transparency
# rxvt-unicode:	lightweight terminal
# xsel:			X clipboard for copy+paste
# rofi:			program launcher (replacement for more lightweight `dmenu`)
# lxappearance:	gtk settings (e.g. themes)

sudo apt-get install -y compton rxvt-unicode xsel rofi lxappearance rxvt-unicode-256color neovim

sudo update-alternatives --set x-terminal-emulator "$(which urxvt)"

#vbox
xrandr --output Virtual1 --model 1920x1200


# TODO polybar i3blocks

