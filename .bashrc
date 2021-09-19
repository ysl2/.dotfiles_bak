# ================
# === Self Add ===
# ================

# ===
# === aliases
# ===
alias ra='ranger'
alias t='tmux'
alias ta='tmux attach'

# ===
# === func
# ===

# ranger退出时跳转到在ranger里的目录
function ranger () {
  local IFS=$'\t\n'
  local tempfile="$(mktemp -t tmp.XXXXXX)"
  local ranger_cmd=(
  command
  ranger
  --cmd="map q chain shell echo %d > "$tempfile"; quitall!"
)

${ranger_cmd[@]} "$@"
if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
  \cd -- "$(cat "$tempfile")" || return
fi
command rm -f -- "$tempfile" 2>/dev/null
}

set -o vi

