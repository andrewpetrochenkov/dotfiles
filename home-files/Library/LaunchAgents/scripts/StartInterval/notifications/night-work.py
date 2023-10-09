#!/usr/bin/env python
# -*- coding: utf-8 -*-
import datetime
import growlnotify
import os

# StartInterval: 300
# Afk_max: 60


def run():
    now = datetime.datetime.now()
    if now.hour >= 6:
        return

    title = "%s ночью надо спать" % now.strftime("%H:%M")
    message = "а не сидеть за компом"
    image = "night-work.png"

    growlnotify.notify(t=title, m=message, image=image, s=True)
    os.system("say:file :launchd:night-work")


if __name__ == "__main__":
    run()
