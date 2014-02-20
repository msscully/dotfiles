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

# Check if stdin is a terminal
# -t is test, so $ man test
if [ -t 1 ];
then
    # Allow Cntrl-s for forward search instead of xon/xoff
    stty -ixon

    # Welcome Message
    echo -e
    echo -ne "Up time: ";uptime | awk /'up/ {print $3,$4}'
fi

# Make vim the default editor
export EDITOR=vim

# Serve current directory using Twisted
# To install on ubuntu
# sudo apt-get install python-twisted-web (or python-twisted for the full engine)
alias serve="twistd -no web --path=. -p 8080"
