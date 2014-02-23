# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

# Set vi
set -o vi

# Set colors
eval `gdircolors ~/.dircolors/dircolors`

# Terminal colours (after installing GNU coreutils)
export PS1='${debian_chroot:+($debian_chroot)}\[\033[00;36m\]\u\[\033[00;32m\]@\[\033[00;32m\]\h\[\033[00m\]:\[\033[00;36m\]\w\[\033[00;32m\]\$ '

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
fi

# Useful aliases
alias ls='gls $LS_OPTIONS'
alias ll='gls $LS_OPTIONS -lhF'
alias l='gls $LS_OPTIONS -lAhF'

# Dir aliases
