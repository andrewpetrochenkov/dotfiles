sudo pfctl -s nat # list redirects

sudo pfctl -F all -ef /etc/pf.conf

echo "
nat-anchor \"com.apple/*\" all
rdr-anchor \"com.apple/*\" all
no rdr inet proto tcp from 127.0.0.1 port 8080
rdr inet proto tcp from any to 127.0.0.1 port 80 -> 127.0.0.1 port 8080
" | sudo pfctl -ef -

echo "
rdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 8080
" | sudo pfctl -ef -

# disable
echo "
nat-anchor \"com.apple/*\" all
rdr-anchor \"com.apple/*\" all
" | sudo pfctl -ef -
sudo pfctl -s nat

