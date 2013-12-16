if [[ "$OSTYPE" == "darwin"* ]]
then
    export PATH=/usr/local:/usr/local/bin:$PATH;
elif [[ "$OSTYPE" == "linux-gnu" ]]
then
    :
fi

# Turn on vi keybindings
set -o vi

# make vim the default editor
export EDITOR=vim

# Needed for virtualenvwrapper to work
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Welcome Message
echo -e
echo -ne "Up time: ";uptime | awk /'up/ {print $3,$4}'

# Allow Cntrl-s for forward search instead of xon/xoff
stty -ixon

# Make vim the default editor
export EDITOR=vim
