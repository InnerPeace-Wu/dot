# dot
configs for neovim etc.

## neovim

### ubuntu

* Linux install [tutorial](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)
```sh
sudo apt-get install neovim
sudo apt-get install ctags
pip3 install neovim
pip3 install flake8 autopep8 jedi
```

```
ln -s path/to/nvim ~/.config/nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
run `nvim` then run `:PlugInstall` 


### OSX

**NOTE**: not updated for a long time.

```sh
brew install neovim
ln -s ~/dot/init.vim ~/.config/nvim/init.vim
ln -s ~/dot/ycm_extra_conf.py ~/.config/nvim/ycm_extra_conf.py
```
* Copy `init.vim` to `~/.config/nvim/`
* Install [vim.plug](https://github.com/junegunn/vim-plug)
Unix
```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
* Open neovim with `nvim` and run `:PlugInstall`
* **Make sure you have python3 installed for plugin works properly.**
misc: use `--user` if needed.
```sh
brew install ctags
pip3 install neovim
pip3 install flake8 autopep8 jedi
nvim -c UpdateRemotePlugins
```

* [Permissions issue when linking python3](https://github.com/Homebrew/homebrew-core/issues/19286#issuecomment-337569936)
```sh
sudo mkdir /usr/local/Frameworks
sudo chown $(whoami):admin /usr/local/Frameworks
```
* flake8 and python3.7 issue: EXTRANEOUS_WHITESPACE_REGEX, [link](https://github.com/PyCQA/pycodestyle/issues/728#issuecomment-404880422)
```sh
pip3 install -e git+https://gitlab.com/pycqa/flake8@9631dac5#egg=flake8
```


## zsh
* [repo](https://github.com/robbyrussell/oh-my-zsh)
```sh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -snf ~/dot/agnoster_diy.zsh-theme ~/.oh-my-zsh/themes/
ln -snf ~/dot/.zshrc ~/.zshrc
```

## tmux
```sh
# mac
brew install tmux
# ubuntu
sudo apt-get install tmux
ln -snf ~/dot/.tmux.conf ~/.tmux.conf
```
