### install packages
```
pacman -S i3-gaps i3lock i3blocks zsh rxvt-unicode neovim \
    compton feh rofi dmenu xsel dunst redshift ranger thunar  \
    ffmpeg ttf-font-awesome ripgrep fd wireless_tools \
    nodejs python python-pip

pip3 install pynvim flake8 cfn-lint --user
```
### suckless st
```
git clone https://github.com/zioufang/st.git
cd st && sudo make install
```
### dotfile
```
git clone https://github.com/zioufang/dotfiles.git
cd dotfile && ./bootstrap.sh
ln -sf ~/projects/dotfiles/.config/i3/config ~/.config/i3/config
ln -sf ~/projects/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
```
