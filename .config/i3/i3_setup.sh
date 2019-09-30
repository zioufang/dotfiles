## DEBIAN BASED

## i3-gaps
#!/bin/bash
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev libxcb-shape0-dev automake

cd /tmp

# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

#sudo apt-get install -y i3 #uncomment to use original i3
sudo apt-get install -y i3status i3lock i3block

# https://github.com/addy-dclxvi/i3-starterpack
# compton:		desktop effects like transparency
# rxvt-unicode:	lightweight terminal
# xsel:			X clipboard for copy+paste
# rofi:			program launcher (replacement for more lightweight `dmenu`)
# lxappearance:	gtk settings (e.g. themes)

sudo apt-get install -y compton rxvt-unicode xsel feh rofi dmenu lxappearance rxvt-unicode-256color \
	neovim thunar dunst redshift ffmpeg fonts-font-awesome xbacklight xfce4-power-manager lm-sensors \
	mpd mpc ncmpcpp  # music 

sudo update-alternatives --set x-terminal-emulator "$(which urxvt)"

# ranger
sudo apt-get install ranger w3m-img
ranger --copy-config=all
