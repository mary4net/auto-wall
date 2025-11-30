#!/usr/bin/env bash
# CHANGE THIS TO YOUR DIR
WALLDIR="$HOME/Pictures/wall"

nochange=false
IMG=$(find "$WALLDIR" -maxdepth 1 -type f | shuf -n1)
TIME=1800

help='''
      Usage:  ./auto_wall.sh [OPTIONS]

      By deault, it change your background via swaybg every 30 min.

      Options:
      -n, --nochange, --no_change     dont change the wallpaper.
      -u, --use string                use this picture as wallpaper.
      -t, --time int[min]             set change time. By default 30min.
      '''

while [[ $# -gt 0 ]]; do
  case "$1" in
    --nochange|no_change|-n)
      nochange=true;
      shift
      ;;
    --use|-u)
      IMG=$2
      shift 2
      ;;
    --time|-t)
      TIME=$(($2*10))
      shift 2
      ;;
    --help|-h)
      printf "%b" "$help"
      exit 0
      ;;
  esac
done


if [[ $nochange == 'true' ]]; then
  pkill swaybg
  systemctl --user stop auto-wall
  swaybg -i "$IMG" -m fill >/dev/null 2>&1 &
else
  while true; do
    pkill swaybg
    swaybg -i "$IMG" -m fill &
    sleep $TIME
    IMG=$(find "$WALLDIR" -maxdepth 1 -type f | shuf -n1)
  done
fi
