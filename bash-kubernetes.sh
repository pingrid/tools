
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


# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/n640538/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/n640538/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/n640538/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/n640538/Downloads/google-cloud-sdk/completion.bash.inc'; fi


source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"