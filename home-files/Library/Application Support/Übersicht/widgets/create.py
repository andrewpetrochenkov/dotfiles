#!/usr/bin/env python
import os
import ubersicht

"""
~/Library/Application Support/Übersicht/widgets/name.widget/index.coffee
~/Library/Application Support/Übersicht/widgets/name.widget/html.sh or html.py
"""


def read(path, default=None):
    return open(path).read().lstrip().rstrip() if os.path.exists(path) else default


for widget in ubersicht.widgets():
    name = os.path.basename(widget)
    sh = os.path.join(widget, "output.sh")
    py = os.path.join(widget, "output.py")

    style = read(os.path.join(widget, "style.css"))
    refresh = read(os.path.join(widget, "refresh.txt"), "1s")
    command = None
    if os.path.exists(py):
        command = "bash -l -c 'python %s'" % "/".join(py.split("/")[-2:])
    if os.path.exists(sh):
        command = "bash -l %s" % "/".join(sh.split("/")[-2:])
    if command:
        widget = ubersicht.Widget(name=name, command=command, refresh=refresh, style=style)
        widget.create()
