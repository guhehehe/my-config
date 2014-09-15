#####################################################
#  Some workaround for the error that cc might cause,
#  due to some changes after Xcode 5.1.
#####################################################
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future


#####################################################
#  Ruby setting? I forgot, probably necessary for 
#  Octopress tools
#####################################################
export PATH=$PATH:~/npm/bin:~/local/bin

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


#####################################################
#  Brew settings
#####################################################
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"


#####################################################
#  Virtualenv setting
#####################################################
export WORKON_HOME=$HOME/envs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
source /usr/local/bin/virtualenvwrapper.sh


#####################################################
# iDefined settings
#####################################################
# Useful aliases
# Make MacVim default vim
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vim='vi'
alias gls='gls --color=always'
alias ls='gls'
alias ll='gls -lhF'
alias l='gls -lAhF'
alias ctags='/usr/local/bin/ctags'
alias gdiff='git diff --color | diff-lines'
alias ggdiff='git diff -U0 --color | diff-lines'

export LINQIA=~/git/linqia
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

# Show line numbers in git diff
function diff-lines() {
    local path=
    local line=
    while read; do
        esc=$'\033'
        if [[ $REPLY =~ ---\ (a/)?.* ]]; then
            continue
        elif [[ $REPLY =~ \+\+\+\ (b/)?([^[:blank:]$esc]+).* ]]; then
            path=${BASH_REMATCH[2]}
            echo $path
            echo '========================='
        elif [[ $REPLY =~ @@\ -[0-9]+(,[0-9]+)?\ \+([0-9]+)(,[0-9]+)?\ @@.* ]]; then
            line=${BASH_REMATCH[2]}
        elif [[ $REPLY =~ ^($esc\[[0-9;]+m)*([\ +-]) ]]; then
            echo "$line:$REPLY"
            if [[ ${BASH_REMATCH[2]} != - ]]; then
                ((line++))
            fi
        fi
    done
}

# Autocomplete Hostnames for SSH etc.
# by Jean-Sebastien Morisset (http://surniaulula.com/)
_complete_hosts () {
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    host_list=`{ 
        for c in /etc/ssh_config /etc/ssh/ssh_config ~/.ssh/config
        do [ -r $c ] && sed -n -e 's/^Host[[:space:]]//p' -e 's/^[[:space:]]*HostName[[:space:]]//p' $c
        done
        for k in /etc/ssh_known_hosts /etc/ssh/ssh_known_hosts ~/.ssh/known_hosts
        do [ -r $k ] && egrep -v '^[#\[]' $k|cut -f 1 -d ' '|sed -e 's/[,:].*//g'
        done
        sed -n -e 's/^[0-9][0-9\.]*//p' /etc/hosts; }|tr ' ' '\n'|grep -v '*'`
    COMPREPLY=( $(compgen -W "${host_list}" -- $cur))
    return 0
}
complete -F _complete_hosts ssh
complete -F _complete_hosts host
