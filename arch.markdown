### install packages
```
pacman -S i3-gaps i3lock i3blocks zsh grml-zsh-config neovim termite \
    compton feh rofi dmenu xsel dunst redshift ranger thunar qutebrowser newsboat \
    ffmpeg ttf-font-awesome ripgrep fd wireless_tools autojump ufw \
    nodejs python python-pip go docker kubectl \
    adobe-source-han-sans-cn-fonts adobe-source-han-sans-tw-fonts

pip install pynvim flake8 cfn-lint ipython3 yapf --user
yay -S tflint-bin

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
