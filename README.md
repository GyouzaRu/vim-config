# Introduction
Simple config for `VIM` editor.  
Use `vim-plug` as plugin manager.  
Plugin list please refers to `plugins.vimrc`

# Usage
1. Make this config as vim default config.
```bash
ln -s $(PWD)/vim-config ~/.vim
```
2. Enter folder and download [junegunn/vim-plug](https://github.com/junegunn/vim-plug).
```bash
cd vim-config
curl -fLo ./autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
2. Execute plugin intall command inside vim
```
:PlugInstall
```
