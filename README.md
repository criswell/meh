SAM'S DOTFILES AND CONFIGS
==========================

Uses GNU Stow to manage dotfiles and configs. Clone into home directory
and stow various things.

Vim
---

With the exception of `vim-mac`, my vim setup is modular.

* `vim` : This is the base, modular config. It should be stow'd, everything
else depends on it.
* `vim-common-linux` : The common linux vim configs. Probably want this for
some sensible defaults.
* `vim-syntastic` : Syntastic.
* `vim-youcompleteme` : YouCompletMe.
* `vim-writing` : Stuff for writing.

LEGACY
------

Those items in the `legacy` directory are considered deprecated and should
not be used anymore.

Copyright
---------
Unless otherwise specified in specific files or sub-directories, code and
files are subject to the license found in COPYING at the top level of this
repository.

