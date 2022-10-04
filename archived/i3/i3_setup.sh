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

# sudo update-alternatives --set x-terminal-emulator "$(which urxvt)"

# termite
sudo apt install build-essential
sudo apt-get install -y git g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac intltool libpcre2-dev libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev libxml2-utils gperf

git clone https://github.com/thestinger/vte-ng.git
echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng
./autogen.sh
make && sudo make install

git clone --recursive https://github.com/thestinger/termite.git
cd termite
make
sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x
sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite


# ranger
sudo apt-get install ranger w3m-img
ranger --copy-config=all


# pip might stuck on collecting package_name for a long time
# disable ip6 for pip to work properly
# add the following to `/etc/sysctl.conf`
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
# save then run
sudo sysctl -p
