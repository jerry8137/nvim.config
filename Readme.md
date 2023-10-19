# The NeoVim config

Most of the content are from the primeagen's video. Great video!

## Install

### Git clone

Open `packer.lua` using nvim:
`nvim ~/.config/nvim/lua/softmac/packer.lua`

### Install Packer

`git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim`

### PackerSync

Inside nvim:
```
:so
:PackerSync
```

## Configure Github Copilot

`:Copilot setup`

To enable:

`:Copilot enable`
