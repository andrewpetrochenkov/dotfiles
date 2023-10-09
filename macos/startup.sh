sudo systemsetup -f -setremotelogin off
sudo mdutil -a -i off
sudo purge
sudo rm -rf /.Spotlight-V100/*
# 6.11 gb

sudo mdutil -d /Volumes/Macintosh\ HD
sudo mdutil -d /Volumes/HDD
