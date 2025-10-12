#!/bin/bash
while true; do
  BAT_PATH="/sys/class/power_supply/BAT0"
  if [ -f "$BAT_PATH/capacity" ]; then
    CAPACITY=$(cat "$BAT_PATH/capacity")
    STATUS=$(cat "$BAT_PATH/status")
    SYMBOL=""

    if [[ $STATUS == "Charging" ]]; then
      SYMBOL=" "
    elif (( CAPACITY > 80 )); then
      SYMBOL=" "
    elif (( CAPACITY > 60 )); then
      SYMBOL=" "
    elif (( CAPACITY > 40 )); then
      SYMBOL=" "
    elif (( CAPACITY > 20 )); then
      SYMBOL=" "
    else
      SYMBOL=" "
    fi

    echo "${SYMBOL} ${CAPACITY}%"
  else
    echo "No Battery"
  fi
  sleep 10
done

