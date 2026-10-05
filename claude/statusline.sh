#!/usr/bin/env bash
# Claude Code status line: @user → cwd / model | ctx bar | rate limits
input=$(cat)
j() { jq -r "$1 // empty" <<<"$input"; }

R=$'\e[0m'; DIM=$'\e[2m'
SALMON=$'\e[38;2;224;108;117m'; GREEN=$'\e[38;2;152;232;152m'; CYAN=$'\e[38;2;140;200;210m'
PURPLE=$'\e[38;2;198;160;246m'; BAR_ON=$'\e[38;2;144;238;144m'; BAR_OFF=$'\e[38;2;40;70;45m'; WHITE=$'\e[97m'; GRAY=$'\e[38;5;245m'

# Line 1
cwd=$(j '.workspace.current_dir'); [ -z "$cwd" ] && cwd=$(j '.cwd'); [ -z "$cwd" ] && cwd=$PWD
cwd=${cwd/#$HOME/\~}
printf '%s%s@%s%s%s %s→%s %s%s%s\n' "$SALMON" "$USER" "$PURPLE" "$(hostname -s)" "$R" "$GREEN" "$R" "$CYAN" "$cwd" "$R"

# Line 2
out="${WHITE}$(j '.model.display_name')${R}"

pct=$(j '.context_window.used_percentage')
if [ -n "$pct" ]; then
  p=$(printf '%.0f' "$pct"); w=10; f=$(( (p * w + 50) / 100 )); [ "$p" -gt 0 ] && [ "$f" -eq 0 ] && f=1
  bar=""; for ((i=0;i<w;i++)); do if [ $i -lt $f ]; then bar+="${BAR_ON}█"; else bar+="${BAR_OFF}█"; fi; done
  size=$(j '.context_window.context_window_size')
  if [ -n "$size" ]; then
    if [ "$size" -ge 1000000 ]; then sz="$((size/1000000))M"; else sz="$((size/1000))K"; fi
    sz="${GRAY}/${sz}${R}"
  fi
  out+=" ${GRAY}|${R} ctx ${bar}${R} ${GREEN}${p}%${R}${sz}"
fi

fmt_reset() { LC_TIME=es_ES.UTF-8 date -r "${1%.*}" '+%a %H:%M' 2>/dev/null | tr -d '.'; }
limit() { # $1=label $2=jq path
  local used reset left s
  used=$(j "$2.used_percentage"); [ -z "$used" ] && return
  left=$(( 100 - $(printf '%.0f' "$used") ))
  s="$1:${GREEN}${left}%${R}"
  reset=$(j "$2.resets_at"); [ -n "$reset" ] && s+=" ${GRAY}⟳$(fmt_reset "$reset")${R}"
  printf '%s' "$s"
}
l5=$(limit 5h '.rate_limits.five_hour'); l7=$(limit 7d '.rate_limits.seven_day')
if [ -n "$l5$l7" ]; then
  out+=" ${GRAY}|${R} left ${l5}"; [ -n "$l7" ] && out+="  ${l7}"
fi
printf '%s\n' "$out"
