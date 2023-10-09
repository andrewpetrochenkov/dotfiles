#!/usr/bin/env python
from flask import Flask
import logging
import os

# KeepAlive: True
# RunAtLoad: True

HOST ='kill.local'
PORT=8080

app = Flask(__name__)
log = logging.getLogger('werkzeug')
log.disabled = True

@app.route('/<pid>')
def kill(pid):
    os.system("kill -PIPE %s 2> /dev/null" % pid)
    return "%s killed" % pid

if __name__ == '__main__':
    app.run(host=HOST,port=PORT)
