#!/usr/bin/open -a Terminal

# python3 -m pip install -r /path/to/requirements.txt
( set -x; /opt/homebrew/bin/python3 --version )
( set -x; /opt/homebrew/bin/python3 -m pip install --break-system-packages --upgrade \
  --index-url https://pypi.mirrors.ustc.edu.cn/simple \
  --default-timeout=120 \
  -r /Volumes/HDD/git/.python/requirements.txt )
