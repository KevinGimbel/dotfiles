[ -f ~/.aliases ] && source ~/.aliases

function csh() {
  local host="$1"
  mist --ip $host && ssh $host
}
