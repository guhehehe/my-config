My configurations for mac
=====================


# Softwares To Install

## Prerequisites

- Xcode
- Developer tools
- Homebrew
- pip

## Dev Environments

- Git
- VirtualBox
- MacVim
- iTerm2
- oh-my-zsh
- GNU coreutils

## Other Useful Apps

- Evernote
- Chrome

# File Locations

These files should be hard linked to local configuration files.

| file in repo                                | file in my system             |
| ------------------------------------------- | ----------------------------- |
| [bash_profile](#bash_profile)               | ~/.bash_profile               |
| [bash_profile](#bash_profile)               | ~/.bashrc                     |
| [dircolors](#dircolors)                     | ~/.dircolors/dircolors        |
| [vimrc](#vimrc)                             | ~/.vimrc                      |
| [256-jungle.vim](#256-junglevim)            | ~/.vim/colors/256-jungle.vim  |
| [python.vim](#python-vim)                   | ~/.vim/syntax/python.vim      |
| [git-completion.bash](#git-completionsh)    | ~/.git-completion.bash        |
| [UltiSnips](#ultisnips)                     | ~/.vim/UltiSnips              |
| [envs](#envs)                               | ~/envs                        |

## `bash_profile`
This file need to be copied to both `~/.bash_profile` and `~/.bashrc`.

`~/.bash_profile` is to be used by Mac's terminal.app, `~/.bashrc` is to be used on 
virturalenvwrapper activation, it is also used by ConqueTerm buffer

## `dircolors`
This file is used by gnu's coreutils for colorize terminal outputs.

## `vimrc`
Copy this to the right place and install vundle before doing anything else, then most of the plugins in this file could be installed by opening up a vim buffer and type `:PluginInstall`.

A few plugins have dependencies. For YouCompleteMe, need to brew install cmake then config and build following the steps on the YCM homepage, for TagBar, need to install Exuberant Ctags. 

Some other plugins need to be installed manually, these plugins are ConqueTerm, 

## `256-jungle.vim`
Vim color scheme file, then `python.vim` syntax file depends on some color definitions in this file.

## `git-completion.sh`
If using zsh then no need to worry about this file. This file is only used in the shells that don't support git auto completion.

## `UltiSnips`
UltiSnips ships many useful snippets, they are are located in `~/.vim/bundle/vim-snippets`.

## `envs`
Currently contains two files: `postactivate` and `postdeactivate`, used for setting up PS1 on virtualenvwrapper activation and deactivation.

