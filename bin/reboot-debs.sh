
ssh leviathan -t "./bin/shutdown-vms.sh && sudo shutdown -r +2"
ssh ntp.local -t "sudo shutdown -r +2"
ssh routepi.local -t "sudo reboot"
