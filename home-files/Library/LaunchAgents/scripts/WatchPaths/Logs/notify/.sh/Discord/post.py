#!/usr/bin/env python
import requests
import json
import os
import socket
import sys

# prevent 400 ERROR
DESCRIPTION_MAX_LENGTH = 1900
TITLE_MAX_LENGTH = 255
TIMEOUT = 5

URL = os.environ["LOGS_WEBHOOK_URL"]
headers = {"Content-Type": "application/json"}
data = {}
data["embeds"] = []
for path in filter(os.path.exists, sys.argv[1:]):
    embed = {}
    embed["description"] = open(path).read()[0:DESCRIPTION_MAX_LENGTH]
    if embed["description"]:
        embed["title"] = path.replace(os.environ["HOME"], "~")[0:TITLE_MAX_LENGTH]
        data["embeds"].append(embed)

if data["embeds"]:
    r = requests.post(URL, data=json.dumps(data), headers=headers, timeout=TIMEOUT)
    try:
        r.raise_for_status()
    except requests.exceptions.ConnectionError: # offline
        pass
    except requests.exceptions.ReadTimeout: # timeout
        pass
    except requests.exceptions.SSLError: # no money :)
        pass
    except socket.timeout: # torrent? :)
        pass
