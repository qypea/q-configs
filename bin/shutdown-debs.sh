
VMS="`ssh leviathan.local ./bin/listvms.sh`"
for m in $VMS; do ssh -t $m "cat /etc/hostname; sudo shutdown -hP +1"; done
ssh leviathan.local -t "sudo shutdown -hP +5"
ssh routepi.local -t "sudo shutdown -hP +1"
ssh ntp.local -t "sudo shutdown -hP +2"
