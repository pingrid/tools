# h is the host name, w the complete path 
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export RABBIT_MQ_PATH=/usr/local/sbin

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true

# Remove zsh spam in terminal: 
export BASH_SILENCE_DEPRECATION_WARNING=1

# Git branch in prompt.

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function logc {
  grep ^{ | jq -r '. | "\(.logLevel) \(.loggerName): \(.msg) ex: \(.exception)"' | gsed --unbuffered -e 's/\(.*FATAL.*\)/\o033[1;31m\1\o033[0;39m/' -e 's/\(.*ERROR.*\)/\o033[31m\1\o033[39m/' -e 's/\(.*WARN.*\)/\o033[33m\1\o033[39m/' -e 's/\(.*INFO.*\)/\o033[32m\1\o033[39m/' -e 's/\(.*DEBUG.*\)/\o033[34m\1\o033[39m/' -e 's/\(.*TRACE.*\)/\o033[30m\1\o033[39m/' -e 's/\(.*[Ee]xception.*\)/\o033[1;39m\1\o033[0;39m/'
}

function logn {
  grep ^{ | jq -r '. | "\(.level) \(.logContext): \(.msg) ex: \(.stack)"' | gsed --unbuffered -e 's/\(.*FATAL.*\)/\o033[1;31m\1\o033[0;39m/' -e 's/\(.*ERROR.*\)/\o033[31m\1\o033[39m/' -e 's/\(.*WARN.*\)/\o033[33m\1\o033[39m/' -e 's/\(.*INFO.*\)/\o033[32m\1\o033[39m/' -e 's/\(.*DEBUG.*\)/\o033[34m\1\o033[39m/' -e 's/\(.*TRACE.*\)/\o033[30m\1\o033[39m/' -e 's/\(.*[Ee]xception.*\)/\o033[1;39m\1\o033[0;39m/'
}

username=“ingrid”
i="\[\033[01;38;5;155m\]I"
n="\[\033[01;38;5;120m\]n"
g="\[\033[01;38;5;40m\]g"
r="\[\033[01;38;5;051m\]r"
i2="\[\033[01;38;5;033m\]i"
d="\[\033[01;38;5;025m\]d🦉"
username=$i$n$g$r$i2$d

function parse_cluster() {
    echo "kubectl config view -o=jsonpath={.current-context} | sed -e 's/gke_ingridgurendev//g;s/_us-central1-a_//g'"
}

source ~/code/ingrid/tools/bash-alias.sh
source ~/code/githubrepos/kubeaware/kubeaware.sh && kubeaware


export PS1="$username \[\033[01;38;5;021m\][at]\W\[\033[01;38;5;063m\]\$(parse_git_branch) | \$(kubeaware_prompt)\[\033[00m\]$ "

get_current_version() {
    version="$(mvn help:evaluate -Dexpression=project.version | grep -e '^[^\[]')"
    echo $version
}

google_deploy() {
    version="$(mvn help:evaluate -Dexpression=project.version | grep -e '^[^\[]')"
    echo "gcloud docker -- push "
}


function generate_random ()
{
    hexdump -n 16 -e '4/4 "%08X" 1 "\n"' /dev/random
}

function title {
    echo -ne "\033]0;"$*"\007"
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#RabbitMQ
if [[ $PATH != *$RABBIT_MQ_PATH* ]]; 
    then
    export PATH=$PATH:$RABBIT_MQ_PATH
fi

function colorgrid( )
{
    iter=16
    while [ $iter -lt 52 ]
    do
        second=$[$iter+36]
        third=$[$second+36]
        four=$[$third+36]
        five=$[$four+36]
        six=$[$five+36]
        seven=$[$six+36]
        if [ $seven -gt 250 ];then seven=$[$seven-251]; fi

        echo -en "\033[38;5;$(echo $iter)m█ "
        printf "%03d" $iter
        echo -en "   \033[38;5;$(echo $second)m█ "
        printf "%03d" $second
        echo -en "   \033[38;5;$(echo $third)m█ "
        printf "%03d" $third
        echo -en "   \033[38;5;$(echo $four)m█ "
        printf "%03d" $four
        echo -en "   \033[38;5;$(echo $five)m█ "
        printf "%03d" $five
        echo -en "   \033[38;5;$(echo $six)m█ "
        printf "%03d" $six
        echo -en "   \033[38;5;$(echo $seven)m█ "
        printf "%03d" $seven

        iter=$[$iter+1]
        printf '\r\n'
    done
}

alias colors=colorgrid

# added by Anaconda2 4.3.0 installer
export PATH="/Users/ingridguren/anaconda/bin:$PATH"

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

export NPM_TOKEN=$(cat ~/.npmrc | grep auth | cut -d'=' -f2)

source ~/code/ingrid/tools/bash-kubernetes.sh

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
  export PATH="/usr/local/opt/gettext/bin:$PATH"


export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
