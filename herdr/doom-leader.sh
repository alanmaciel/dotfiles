#!/bin/bash
# Doom Emacs-style leader groups for herdr (popup "which-key").
# Usage: doom-leader.sh w|tab|b   (bound to prefix+w / prefix+tab / prefix+b)

H="${HERDR_BIN_PATH:-herdr}"
P="$HERDR_ACTIVE_PANE_ID"
W="$HERDR_ACTIVE_WORKSPACE_ID"
group="$1"

dim=$'\e[2m'; key=$'\e[1;35m'; rst=$'\e[0m'
item() { printf "  ${key}%-6s${rst} %s\n" "$1" "$2"; }

ask() { # ask "Prompt" -> echoes answer
  printf "\n  %s: " "$1" >/dev/tty
  local ans; IFS= read -r ans; printf '%s' "$ans"
}

# ids of a JSON list ($1 = herdr args..., jq path to list, id field)
ids() { "$H" $1 | jq -r "$2 | .[].$3"; }
focused_idx() { "$H" $1 | jq -r "$2 | map(.focused) | index(true)"; }

cycle() { # cycle "<herdr list args>" "<jq list path>" "<id field>" "<focus cmd>" +1|-1
  local list=($(ids "$1" "$2" "$3")) n i
  n=${#list[@]}; [ "$n" -eq 0 ] && return
  i=$(focused_idx "$1" "$2"); [ "$i" = "null" ] && i=0
  i=$(( (i + $5 + n) % n ))
  "$H" $4 "${list[$i]}" >/dev/null
}

nth() { # nth "<herdr list args>" "<jq list path>" "<id field>" "<focus cmd>" N
  local list=($(ids "$1" "$2" "$3")) i=$(( $5 - 1 ))
  [ -n "${list[$i]}" ] && "$H" $4 "${list[$i]}" >/dev/null
}

WS_LIST="workspace list"; WS_PATH=".result.workspaces"
TAB_LIST="tab list --workspace $W"; TAB_PATH=".result.tabs"
current_tab() { "$H" $TAB_LIST | jq -r "$TAB_PATH | map(select(.focused))[0].tab_id"; }

case "$group" in
  w)
    echo "  ${dim}SPC w — windows (panes)${rst}"
    item "h j k l" "focus ←↓↑→"
    item "H J K L" "swap ←↓↑→"
    item "v / s" "split right / below"
    item "d / c" "close pane"
    item "m" "maximize (zoom toggle)"
    item "< > + -" "resize"
    item "r" "rename pane"
    ;;
  tab)
    echo "  ${dim}SPC TAB — workspaces${rst}"
    item "[ / ]" "prev / next"
    item "1..9" "go to workspace N"
    item "n" "new workspace"
    item "d" "delete workspace"
    item "r" "rename workspace"
    ;;
  b)
    echo "  ${dim}SPC b — buffers (tabs)${rst}"
    item "[ / ]" "prev / next tab"
    item "1..9" "go to tab N"
    item "n / N" "new tab"
    item "k / d" "kill tab"
    item "r" "rename tab"
    ;;
  *) exit 1 ;;
esac
echo; echo "  ${dim}esc: cancel${rst}"

IFS= read -rsn1 k
[ "$k" = $'\e' ] && exit 0

case "$group:$k" in
  w:h) "$H" pane focus --direction left  --pane "$P" ;;
  w:j) "$H" pane focus --direction down  --pane "$P" ;;
  w:k) "$H" pane focus --direction up    --pane "$P" ;;
  w:l) "$H" pane focus --direction right --pane "$P" ;;
  w:H) "$H" pane swap --direction left  --pane "$P" ;;
  w:J) "$H" pane swap --direction down  --pane "$P" ;;
  w:K) "$H" pane swap --direction up    --pane "$P" ;;
  w:L) "$H" pane swap --direction right --pane "$P" ;;
  w:v) "$H" pane split --pane "$P" --direction right --focus ;;
  w:s) "$H" pane split --pane "$P" --direction down --focus ;;
  w:d|w:c) "$H" pane close "$P" ;;
  w:m) "$H" pane zoom --pane "$P" --toggle ;;
  w:\<) "$H" pane resize --direction left  --pane "$P" ;;
  w:\>) "$H" pane resize --direction right --pane "$P" ;;
  w:+) "$H" pane resize --direction up    --pane "$P" ;;
  w:-) "$H" pane resize --direction down  --pane "$P" ;;
  w:r) name=$(ask "Pane name"); [ -n "$name" ] && "$H" pane rename "$P" "$name" ;;

  tab:\[) cycle "$WS_LIST" "$WS_PATH" workspace_id "workspace focus" -1 ;;
  tab:\]) cycle "$WS_LIST" "$WS_PATH" workspace_id "workspace focus" 1 ;;
  tab:[1-9]) nth "$WS_LIST" "$WS_PATH" workspace_id "workspace focus" "$k" ;;
  tab:n) "$H" workspace create --focus ;;
  tab:d) a=$(ask "Close workspace? (y/n)"); [ "$a" = y ] && "$H" workspace close "$W" ;;
  tab:r) name=$(ask "Workspace name"); [ -n "$name" ] && "$H" workspace rename "$W" "$name" ;;

  b:\[) cycle "$TAB_LIST" "$TAB_PATH" tab_id "tab focus" -1 ;;
  b:\]) cycle "$TAB_LIST" "$TAB_PATH" tab_id "tab focus" 1 ;;
  b:[1-9]) nth "$TAB_LIST" "$TAB_PATH" tab_id "tab focus" "$k" ;;
  b:n|b:N) t=$("$H" tab create --workspace "$W" --focus | jq -r ".result.tab.tab_id // .result.tab_id // empty"); [ -n "$t" ] && "$H" tab focus "$t" ;;
  b:k|b:d) "$H" tab close "$(current_tab)" ;;
  b:r) name=$(ask "Tab name"); [ -n "$name" ] && "$H" tab rename "$(current_tab)" "$name" ;;
esac >/dev/null 2>&1
exit 0
