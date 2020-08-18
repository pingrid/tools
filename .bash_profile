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

function find_process_on_port() {
  sudo lsof -i tcp:$1
}

function kill_process_with_id() {
  kill -9 $1
}

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

dcstart() {
  docker-compose ps -d $1
}

mandag() {
  cd ~/code/kurator-toolbox && docker-compose pull && docker-compose up -d 
}


fredag() {
  cd ~/code/kurator-toolbox && docker-compose stop
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

# Kubectl commands
alias ku=kubectl
alias kug='kubectl get'
alias kugd='kubectl get deployments'
alias kugs='kubectl get services'
alias kugp='kubectl get pods'
alias kugpw='kubectl get pods -o wide'
alias kud='kubectl describe'
alias kuds='kubectl describe services'
alias kudd='kubectl describe deployments'
alias pnp='private-npm-publish'
alias kucc='kubectl config current-context'
alias kuuc='kubectl config use-context'
alias kua=kubeaware
alias kuan=kubeunaware
alias kuns=kubens
alias wp='watch kubectl get pods'

# Kubernetes/Gcloud shortcuts

alias printenv=gi_meg_env

alias claat='~/go/src/github.com/googlecodelabs/tools/claat/bin/claat'
alias lokal_db='echo -e "\033]6;1;bg;blue;brightness;181\a" && mysql -u root -p'


alias process_on_port=find_process_on_port
alias kill_process=kill_process_with_id


# Git Shortcuts
alias gl='git log --oneline'
alias mci='mvn clean install'
alias upt='cd ../../../'
alias editprofile='open ~/.bash_profile'
alias edit='sublime ~/.bash_profile &'
alias deletemergedbranches='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'



alias update='source ~/.bash_profile'
alias reload='source ~/.bash_profile'

alias linehvordanerdetjegpusher='git fwl'
alias linehvordanpusherjeg='git fwl'
alias linepush='git fwl'

alias ls='ls -la'
alias lsdir='ls -d */'

# Docker compose
alias dcs='docker-compose'
alias dstop='docker-compose stop'
alias dall='docker-compose up -d'
alias docker_stop_all='docker rmi -f $(docker images -a -q)'

# Navigating in Kurator
alias bo='echo -e "\033]6;1;bg;green;brightness;176\a" && title kurator-editor && cd ~/code/nrkno-kurator-editor'
alias fo='echo -e "\033]6;1;bg;blue;brightness;176\a" && title kurator-visning && cd ~/code/nrkno-kurator-visning'


alias mkbranch="~/code/nrk-make-branch-from-jira-issue/make-branch-from-jira-issue.py -l 7288029804871909241"


alias simplechrome='open -na "Google Chrome" --args "--app=https://url.com"'

alias webstorm='open -a /Applications/Webstorm.app/ .'
alias intellij='/usr/local/bin/idea'
alias medis='cd code/medis && npm i && npm run build && npm run start'
alias fredag='fredag'
alias mandag='mandag'

alias list_all_java='ls -l /Library/Java/JavaVirtualMachines/'
alias java_home='/usr/libexec/java_home'

alias hosts='sublime /etc/hosts'

alias j11="export JAVA_HOME=`/usr/libexec/java_home -v 11`; java -version"
alias j10="export JAVA_HOME=`/usr/libexec/java_home -v 10`; java -version"
alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"
alias j7="export JAVA_HOME=`/usr/libexec/java_home -v 1.7`; java -version"

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

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/n640538/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/n640538/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/n640538/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/n640538/Downloads/google-cloud-sdk/completion.bash.inc'; fi


function kn() {
  kubectl config set-context $1 --namespace=$2
  kubectl config use-context $1
}

function _kn() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="$(kubectl config get-contexts  -o name)"
  if kubectl config get-contexts -o name | grep -q "^$prev$"
  then
    opts=$(kubectl "--context=$prev" get namespaces -o go-template --template="{{range .items}}{{.metadata.name}} {{end}}")
  fi
  COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
  return 0
}

  [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
complete -F _kn kn


  [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
  export PATH="/usr/local/opt/gettext/bin:$PATH"


export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
