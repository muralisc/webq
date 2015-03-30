#!/bin/bash

for threadno in {1..75..2}
do
    sed -i 's/threads">\([0-9]\+\)/threads">'$(( $threadno * 10  ))'/' open_tstMarch09.jmx
    sed -i 's/14-\([0-9]\+\)/14-'$threadno'/' open_tstMarch09.jmx
    git --no-pager diff open_tstMarch09.jmx
    jmeter -n -t open_tstMarch09.jmx
done

# alram on my machine when all this is over !! ;)
sshpass -p 'password' ssh murali@10.16.35.52 'paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga'
