### install packages
```
pacman -S bspwm sxhkd xdo zsh grml-zsh-config neovim alacritty termite xcape \
    picom feh rofi xsel dunst scrot redshift qutebrowser vifm \
    ripgrep wireless_tools autojump ufw rclone bat tldr\
    nodejs npm python python-pip go docker kubectl \
    adobe-source-han-sans-cn-fonts adobe-source-han-sans-tw-fonts

mkdir ~/.cache/zsh
mkdir -p ~/sources && git clone https://github.com/zsh-users/zsh-autosuggestions ~/sources/zsh-autosuggestions 
yay -S autojump polybar-git autojump joplin
pip install awscli
chsh --shell /bin/zsh

# nerd-fonts patched version is needed for its glyphes for devicon in vifm
# download from https://github.com/ryanoasis/nerd-fonts/releases
# move to ~/.local/share/fonts

# for fzf scripts to work in $term -e mode
# check go bin path for lnch, default to ~/go/bin/lnch
go get github.com/zioufang/lnch

# docker permission
sudo groupadd docker
sudo usermod -aG docker ${USER}
# restart to take effect

# vim related
pip install flake8 cfn-lint ipython ipdb yapf neovim --user
yay -S tflint-bin
# go specific
go get -u golang.org/x/lint/golint
go get golang.org/x/tools/gopls@latest
go get golang.org/x/tools/cmd/goimports
go get -u github.com/cweill/gotests

sudo ufw enable

# run this for lock screen
yay -S betterlockscreen
betterlockscreen -u ~/.config/wallpapers
```
### dotfile
```
git clone https://github.com/zioufang/dotfiles.git
cd dotfile && ./bootstrap.sh
ln -sf ~/projects/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
```
### apache-spark specific
install stable python for apache spark
```
PYTHON_VERSION=3.7.5
wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
tar -xf Python-${PYTHON_VERSION}
cd Python-${PYTHON_VERSION}
./configure --prefix=/opt/python/${PYTHON_VERSION}
make
sudo make install
echo "export PYSPARK_PYTHON=/opt/python/${PYTHON_VERSION}" >> ~/.zshrc
```

### sync with gdrive
```
# !!!!
# !!!! COPY zsh history from G-Drive FIRST !!!!
# !!!!
# sync zsh history
mkdir -p ~/gdrive/zsh
rclone config
ln -s ~/.cache/zsh/history ~/gdrive/zsh

# runs copy at startup in .xprofile
# rclone copy --copy-links ~/gdrive gdrive:sync
```
