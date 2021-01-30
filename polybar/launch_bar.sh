 
#!/bin/bash

# Terminate already running bar instances
killall -q polybar
#polybar -r my_bar &

#polybar -r bot_bar &

for m in $(polybar --list-monitors | cut -d":" -f1); do
    if [ $m != DP1 ]
       then 
#	MONITOR=$m polybar --reload bot_bar &
	MONITOR=$m polybar --reload my_bar &
    fi
done


echo "Polybar launched..."
