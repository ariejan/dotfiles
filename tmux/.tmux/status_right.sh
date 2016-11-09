#!/bin/bash

CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="$1" || bg="%k"
  [[ -n $2 ]] && fg="$2" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " #[fg=$bg,bg=$CURRENT_BG]$SEGMENT_SEPARATOR#[fg=$fg,bg=$bg] "
  else
    echo -n " #[default,fg=$bg]$SEGMENT_SEPARATOR#[bg=$bg,fg=$fg] "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n " $3 "
}

# End the prompt, closing any open segments
prompt_end() {
    echo " "
}

prompt_date_clock() {
    when=$(date "+%Y-%m-%d %H:%M")
    prompt_segment "#444444" "#ffffff" "◷ $when"
}

prompt_date() {
    when=$(date "+%d/%m/%y")
    prompt_segment "#17297c" "#031770" "$when"
}

prompt_clock() {
    time=$(date "+%H:%M")
    prompt_segment "#1AE1FD" "#031770" "◷ $time"
}

prompt_boxname() {
    name=$(hostname)
    prompt_segment "#dfff00" "#202020" "$name"
}

build_prompt() {
    RETVAL=$?
    prompt_date_clock
    prompt_boxname
    prompt_end
}

echo $(build_prompt)
