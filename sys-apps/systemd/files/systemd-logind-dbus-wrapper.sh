#!/bin/sh

if [ -e /run/openrc/softlevel ]; then
	# openrc booted the system
	exec /usr/lib/systemd/systemd-logind
else
	# systemd booted the system, the original executable
	# is just /bin/false.
	exec /bin/false
fi
