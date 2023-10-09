#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import task.setup
from task.classes import update

# StartInterval: 60
# RunAtLoad: true


def run():
    if "accepting" in os.popen("pg_isready").read():
        update()


if __name__ == "__main__":
    run()
