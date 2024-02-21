SAM'S DOTFILES AND CONFIGS
==========================

Uses GNU Stow to manage dotfiles and configs. Clone into home directory
and stow various things.

Quite frankly, if you're using some convoluted script to install your
dotfiles instead of GNU Stow you're doing it wrong. Yes, I drew that line
in the sand....

Vim
---

My vim setup is modular.

* `vim` : This is the base, modular config. It should be stow'd, everything
else depends on it.
* `vim-common-linux` : The common linux vim configs. Probably want this for
some sensible defaults.
* `vim-syntastic` : Syntastic.
* `vim-youcompleteme` : YouCompletMe.
* `vim-writing` : Stuff for writing.
* `vim-orgmode` : Stuff relating to [vim-orgmode](https://github.com/jceb/vim-orgmode)

LEGACY
------

Those items in the `legacy` directory are considered deprecated and should
not be used anymore.

DETAILS
-------

More details on what's here can be found [here](DESC.md)

Copyright
---------
Unless otherwise specified in specific files or sub-directories, code and
files are subject to the license found in COPYING at the top level of this
repository.

