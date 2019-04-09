
ssh leviathan.local -t "./bin/shutdown-vms.sh && sudo shutdown -r +2"
ssh hassiopi.local -t "sudo shutdown -r +2"
ssh routepi.local -t "sudo reboot"
