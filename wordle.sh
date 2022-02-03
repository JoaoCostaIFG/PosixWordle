#!/bin/sh

if [ -f "./dict" ]; then
  dictfile="./dict"
elif [ -f "/usr/share/dict/words" ]; then
  dictfile="/usr/share/dict/words"
else
  echo "No dict file on directory or fallback system dictionary (/usr/share/dict/words) found. Exiting..."
  exit 1
fi

max_wcnt="$(grep -c '^\w\w\w\w\w$' "$dictfile")"
soli="$(shuf -i 0-"$max_wcnt" -n 1)"
sol="$(grep -m "$soli" '^\w\w\w\w\w$' "$dictfile" | tail -1 | tr '[:lower:]' '[:upper:]')"

max_guess=6
curr_guess=1
while [ $curr_guess -le $max_guess ]; do
  guess=""
  while [ "$(printf "%s" "$guess" | wc -c)" -ne 5 ] || [ "$(printf "%s" "$guess" | grep -c '[^a-zA-Z]')" -gt 0 ]; do
    printf "Your guess [%d/%d]: " "$curr_guess" "$max_guess"
    read -r guess
  done
  guess="$(printf "%s" "$guess" | tr '[:lower:]' '[:upper:]')"

  correct=0
  for i in 1 2 3 4 5; do
    sol_char="$(printf "%s" "$sol" | cut "-c${i}")"
    guess_char="$(printf "%s" "$guess" | cut "-c${i}")"

    if [ "$sol_char" = "$guess_char" ]; then
      correct=$((correct + 1))
      printf "\033[30;102m%s\033[0m" "$guess_char"
    elif echo "$sol" | grep -q -F "$guess_char"; then
      printf "\033[30;103m%s\033[0m" "$guess_char"
    else
      printf "\033[30;107m%s\033[0m" "$guess_char"
    fi
  done
  echo

  if [ "$correct" -eq 5 ]; then
    echo "You got it!"
    curr_guess=7
  else
    curr_guess=$((curr_guess + 1))
  fi
done

printf "Solution: %s\n" "$sol"
