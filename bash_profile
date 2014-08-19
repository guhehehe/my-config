# Some workaround for the error that cc might cause, due to some changes after Xcode 5.1.
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future

# Starmaker dev config.
export PATH=$PATH:~/npm/bin:~/local/bin
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/venvprojects
source /usr/local/bin/virtualenvwrapper.sh

export CLICOLOR=YES

# Set vi
set -o vi

# Set colors
eval `gdircolors ~/.dircolors/dircolors`

# Terminal colours (after installing GNU coreutils)
export PS1='${debian_chroot:+($debian_chroot)}\[\033[00;36m\]\u\[\033[00;32m\]@\[\033[00;32m\]\h\[\033[00m\]:\[\033[00;36m\]\w\[\033[00;32m\]\$ '

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
fi

# Git auto completion.
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Useful aliases
# Make MacVim default vim
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vim='vi'
alias gls='gls --color=always'
alias ls='gls'
alias ll='gls -lhF'
alias l='gls -lAhF'
alias ctags='/usr/local/bin/ctags'

alias activate='source /Users/hegu/venvprojects/starmaker/sm-venv/bin/activate'

# Dir aliases

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
