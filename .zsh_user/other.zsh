#!/bin/zsh

# denv
which denv >/dev/null 2>&1
if [ $? -ne 1 ]; then
    eval "$(denv init -)"
fi

# emacs
if ! pgrep -f '[Ee]macs' >/dev/null 2>&1; then
    emacs --daemon >/dev/null 2>&1
fi

# python
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi


[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# SSH_AGENT_FILE="$HOME/.ssh-agent-info"
# test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE

# if !  $SSH_AUTH_SOCK ; then
#     ssh-agent -t $[60*60*5] > $SSH_AGENT_FILE
#     source $SSH_AGENT_FILE
#     ssh-add
# fi

