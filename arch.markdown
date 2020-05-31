### install packages
```
pacman -S bspwm sxhkd zsh grml-zsh-config neovim alacritty termite \
    picom feh rofi xsel dunst redshift thunar qutebrowser \
    ffmpeg ttf-font-awesome ripgrep fd wireless_tools autojump ufw rclone \
    nodejs npm python python-pip go docker kubectl \
    adobe-source-han-sans-cn-fonts adobe-source-han-sans-tw-fonts

# i3 packages
# i3-gaps i3lock i3blocks 

pip install pynvim flake8 cfn-lint ipython3 black --user
yay -S tflint-bin polybar-git

# for fzf scripts to work in $term -e mode
# check go bin path for lnch, default to ~/go/bin/lnch
go get github.com/zioufang/lnch

# need to rename the monitor in polybar from Virtual-1 to the correct one

sudo ufw enable
```
### dotfile
```
git clone https://github.com/zioufang/dotfiles.git
cd dotfile && ./bootstrap.sh
ln -sf ~/projects/dotfiles/.config/i3/config ~/.config/i3/config
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
