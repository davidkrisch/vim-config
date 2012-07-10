This project is my vim configuration.  I use it for daily development on Mac OS X.

# Installation

1. Backup your existing configuration (`~/.vimrc` and `~/.vim`)
2. Clone the repository

        git clone git@github.com:davidkrisch/vim-config.git ~/.vim
        cp ~/.vim/vimrc ~/.vimrc

3. Sync the Git submodules
    
        cd ~/.vim
        git submodule init
        git submodule update

4. Launch `vim` and run `:BundleInstall`

## Plugin Specific Installation

### Command-T

See [this](https://github.com/wincent/Command-T) for a full rundown on Command-T installation.

Quickly, Command-T requires Vim (with Ruby support), Ruby, and a C compiler.  To see if you have 
Ruby support compiled into vim, execute `vim --version` and make sure `+ruby` is listed somewhere.
If you find `-ruby`, you'll need to install a Vim with Ruby support.

    cd ~/.vim/bundle/command-t/ruby/command-t
    ruby extconf.rb
    make

# Color Scheme

For a Vim colorscheme, I use [Solarized](http://ethanschoonover.com/solarized). I install it as the 
default colorscheme in iTerm2 and Vim inherits the colorscheme. Installation instructions can be
found in the solarized submodule of this repository or 
[here](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized).
