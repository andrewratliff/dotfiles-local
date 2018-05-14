function logbook() {
    vim ~/Dropbox/logbook/$(date '+%Y-%m-%d').md
}

function tail_logs() {
  ssh "$1".qa.arin.net "tail -F /opt/arin/jboss-as/standalone/log/server.log"
}

function cat_properties() {
  ssh "$1".qa.arin.net "/opt/arin/jboss-as/bin/system-properties.sh"
}

# Check if the function exists (bash specific)
if declare -f "$1" > /dev/null
then
  # call arguments verbatim
  "$@"
else
  # Show a helpful error
  echo "'$1' is not a known function name" >&2
  exit 1
fi
