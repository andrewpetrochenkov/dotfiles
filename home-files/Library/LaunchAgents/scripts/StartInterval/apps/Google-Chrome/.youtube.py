#!/usr/bin/env python
import os
import sys
import subprocess
import webloc


CACHE_DIR = os.path.expanduser("~/Library/Caches/youtube-dl")
DIR = os.path.expanduser("~/Movies/.workout")


def find(name):
    for l in os.listdir(os.getcwd()):
        if name in l:
            return os.path.join(os.getcwd(), l)


def download(url, name):
    args = ["youtube-dl", "--cache-dir", CACHE_DIR, "-o", name, url]
    subprocess.check_call(args, stderr=subprocess.PIPE)


top = os.path.dirname(__file__)
for root, dirs, files in os.walk(top):
    for f in filter(lambda f: f.split(".")[-1] == "webloc", files):
        name = os.path.splitext(f)[0]
        url = webloc.read(os.path.join(root, f))
        youtube_id = url.split("=")[1]
        path = os.path.join(DIR, youtube_id)
        if not os.path.exists(path):
            os.makedirs(path)
        os.chdir(path)
        download(url, name)


if __name__ == "__main__":
    pass
    # create(os.path.expanduser("~/Movies/.workout"))
