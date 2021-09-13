# Helper functions
function title {
    echo -ne "\033]0;"$*"\007"
}


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
alias print_global_env=gi_meg_env

alias claat='~/go/src/github.com/googlecodelabs/tools/claat/bin/claat'
alias lokal_db='echo -e "\033]6;1;bg;blue;brightness;181\a" && mysql -u root -p'


alias test_command='echo Dette funker Ingrid!!'
alias process_on_port='sudo lsof -i tcp:$1'
alias kill_process='kill -9 $1'


# Restart docker
alias restart_docker='killall Docker && cd /Applications;open -a Docker;cd ~'

# Git Shortcuts
alias gl='git log --oneline'
alias mci='mvn clean install'
alias upt='cd ../../../'
alias editprofile='open ~/.bash_profile'
alias edit='sublime ~/.bash_profile &'
alias delete_merged_branches='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'


# Back commands

alias update='source ~/.bash_profile'
alias reload='source ~/.bash_profile'

alias line_push='git fwl'

alias ls='ls -la'
alias lsdir='ls -d */'

# Docker compose
alias dcs='docker-compose'
alias dstop='docker-compose stop'
alias dall='docker-compose up -d'
alias docker_stop_all='docker rmi -f $(docker images -a -q)'

# Navigating in Kurator
alias keditor='echo -e "\033]6;1;bg;green;brightness;176\a" && title kurator-editor && cd ~/code/nrkno-kurator-editor'
alias kvisning='echo -e "\033]6;1;bg;blue;brightness;176\a" && title kurator-visning && cd ~/code/nrkno-kurator-visning'

alias mkbranch="~/code/nrk-make-branch-from-jira-issue/make-branch-from-jira-issue.py -l 7288029804871909241"


# Applications 
alias simplechrome='open -na "Google Chrome" --args "--app=https://url.com"'
alias webstorm='open -a /Applications/Webstorm.app/ .'
alias intellij='/usr/local/bin/idea'
alias medis='cd code/medis && npm i && npm run build && npm run start'


alias fredag='cd ~/code/kurator-toolbox && docker-compose stop'
alias mandag='cd ~/code/kurator-toolbox && docker-compose pull && docker-compose up -d '


alias hosts='sublime /etc/hosts'

# Java 
alias list_all_java='ls -l /Library/Java/JavaVirtualMachines/'
alias java_home='/usr/libexec/java_home'
alias j11="export JAVA_HOME=`/usr/libexec/java_home -v 11`; java -version"
alias j10="export JAVA_HOME=`/usr/libexec/java_home -v 10`; java -version"
alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"
alias j7="export JAVA_HOME=`/usr/libexec/java_home -v 1.7`; java -version"
