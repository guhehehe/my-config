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

| file in repo                              | file in my system               |
| ----------------------------------------- | ------------------------------- |
| [bash_profile](#bash_profile)             | ~/.bash_profile                 |
| [bash_profile](#bash_profile)             | ~/.bashrc                       |
| [dircolors](#dircolors)                   | ~/.dircolors/dircolors          |
| [vimrc](#vimrc)                           | ~/.vimrc                        |
| [256-jungle.vim](#256-junglevim)          | ~/.vim/colors/256-jungle.vim    |
| [python.vim](#python-vim)                 | ~/.vim/syntax/python.vim        |
| [git-completion.bash](#git-completionsh)  | ~/.git-completion.bash          |
| [UltiSnips](#ultisnips)                   | ~/.vim/UltiSnips                |
| [envs](#envs)                             | ~/envs                          |
| zsh/themes/fabulous.zsh-theme             | ~/zsh/themes/fabulous.zsh-theme |
| zsh/zshrc                                 | ~/.zshrc                        |

## `bash_profile`
This file need to be copied to both `~/.bash_profile` and `~/.bashrc`.

`~/.bash_profile` is to be used by Mac's terminal.app, `~/.bashrc` is to be
used on virturalenvwrapper activation, it is also used by ConqueTerm buffer

## `dircolors`
This file is used by gnu's coreutils for colorize terminal outputs.

## `vimrc`
Copy this to the right place and install vundle before doing anything else,
then most of the plugins in this file could be installed by opening up a vim
buffer and type `:PluginInstall`.

A few plugins have dependencies. For YouCompleteMe, need to brew install cmake
then config and build following the steps on the YCM homepage, for TagBar,
need to install Exuberant Ctags.

Some other plugins need to be installed manually, these plugins are ConqueTerm
and Vundle.

## `256-jungle.vim`
Vim color scheme file, then `python.vim` syntax file depends on some color
definitions in this file.

## `git-completion.sh`
If using zsh then no need to worry about this file. This file is only used in
the shells that don't support git auto completion.

## `UltiSnips`
UltiSnips ships many useful snippets, they are are located in
`~/.vim/bundle/vim-snippets`.

## `envs`
Currently contains two files: `postactivate` and `postdeactivate`, used for
setting up PS1 on virtualenvwrapper activation and deactivation.


# About The Colors, Fonts, Sizes And All

It is necessary to tweak a little bit to make everything lined up. I need to
set the font and adjust the size as well as the vertical and horizontal spaces
to make all the unicode special characters looks just right in both Vim and
the terminal. I've been experienting for quite a while to figure out the best
combination of font and all kinds of spaces. Here's what it is.

I didn't test the configuration on many different OSes with various settings,
since I only use Mac OSX and Ubuntu 12.10. Also because I've been using Mac
99% of the time lately, I didn't bother to make every setting work on my Linux
box. To get everything work, you need: Mac, MacVim 7.4+, iTerm2 with xterm-256
color terminal type, zsh with oh-my-zsh plugin.

_**Note:** Everything is based on 256 colors._

First you need to use 256-jungle color scheme for your Vim. The scheme file
can be found in this repo. Put it to the right place.

Put the fabulous theme and the zshrc you found in this repo in the right place
on your local machine (actually the only thing needed in zshrc is the
`show_git_prompt` funtion, so you can just copy and paste that function to
your .zshrc.)

Install the Solarized color scheme for iTerm2 (google solarized iterm2 should
take care of this).

Now you should have a better looking terminal and Vim color scheme.

I also installed powerline on Vim, and the font and size settings make the
powerline status line looks messy. After tweaking, I came up with these
settings, which should make powerline looks better:

- iTerm regular font: 14pt Dejavu San Mono for Powerline.
- iTerm Non-ASCII font: 15pt Literation Mono for Powerline.
- Set horizontal space to .9, vertical to .95.
![Vim Screenshot](/images/vim.png)
![Terminal Screenshot](/images/terminal.png)

# Virtual Machine And SSH And So On

## File system mount

This enables the OS in your virtual machine to talk to your local file system
over a ssh tunel.
* Make sure your Mac allows remote login: go to system preference->sharing,
turn Remote Login on.
* Instal sshfs on the virtual machine and setup something.

    ```shell
        sudo apt-get install sshfs
        sudo adduser $USER fuse
    ```

    Then enable user_allow_other in /etc/fuse.conf

    If that doesn't work, see if root group owns /dev/fuse, if not, do:

    ```shell
        sudo chown root:fuse /dev/fuse
    ```

    And ake sure the permission is 660

* Mount a share: `sshfs -o allow_other $USER@$HOST:src ~/src`
* Unmount a share: `fusermount -u ~/src`
