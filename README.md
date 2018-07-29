# dot
configs for neovim etc.

## neovim
* Linux install [tutorial](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)
* OSX
```sh
brew install neovim
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
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh
```

## tmux
```sh
brew install tmux
```
