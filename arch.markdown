### install packages
```
pacman -S i3-gaps i3lock i3blocks zsh grml-zsh-config neovim \
    compton feh rofi dmenu xsel dunst redshift ranger thunar qutebrowser newsboat \
    ffmpeg ttf-font-awesome ripgrep fd wireless_tools autojump ufw \
    nodejs python python-pip go docker kubectl \
    adobe-source-han-sans-cn-fonts adobe-source-han-sans-tw-fonts

pip install pynvim flake8 cfn-lint ipython3 --user

sudo ufw enable
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
