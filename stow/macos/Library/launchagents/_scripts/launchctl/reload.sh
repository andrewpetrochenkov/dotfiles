( set -x; find /Volumes/HDD/var/postgres -name postmaster.pid -exec rm {} \; )
( set -x; find ~/Library/LaunchAgents -name "postgresql.*.plist" -exec launchctl unload {} \; )
( set -x; find ~/Library/LaunchAgents -name "postgresql.*.plist" -exec launchctl load {} \; )
