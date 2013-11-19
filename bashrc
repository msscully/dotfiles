# Turn on vi keybindings
set -o vi

# Needed for virtualenvwrapper to work
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Welcome Message
echo -e
echo -ne "Up time: ";uptime | awk /'up/ {print $3,$4}'

# Allow Cntrl-s for forward search instead of xon/xoff
stty -ixon
