amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }'
