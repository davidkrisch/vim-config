This project is my vim configuration.  I use it for daily development on Mac OS X.

# Installation

1. Backup your existing configuration (`~/.vimrc` and `~/.vim`)
2. Clone the repository

        git clone git@github.com:davidkrisch/vim-config.git ~/.vim
        cp ~/.vim/vimrc ~/.vimrc

3. Clone Vundle

        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

3. Sync the Git submodules

        cd ~/.vim
        git submodule init
        git submodule update

4. Launch `vim` and run `:BundleInstall`

## Plugin Specific Installation

### Color Scheme

For a Vim colorscheme, I use [Solarized](http://ethanschoonover.com/solarized). I install it as the
default colorscheme in iTerm2 and Vim inherits the colorscheme. Installation instructions can be
found in the solarized submodule of this repository or
[here](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized).

### Patched fonts

For the lightline plugin, we need to install patched fonts. For whatever reason,
downloading and installing the recommended fonts does not work.  I followed the
directions to manually patch the fonts
[here](https://github.com/davidkrisch/vim-powerline/tree/develop/fontpatcher).

    cd fonts/firaMono/
    fontforge -script ../../vim-powerline/fontpatcher/fontpatcher FuraMono-Regular\ Powerline.otf

After the patching is complete, open FontBook and install the newly patched font.

The fonts themselves come from https://github.com/powerline/fonts. I like FiraMono regular.
