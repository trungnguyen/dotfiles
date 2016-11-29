#! /usr/bin/env python

import json
import os.path
from os import rename, symlink, remove
from sys import argv

if len(argv) <= 1:
    print('Please specify the environment')
    exit(1)

repo_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
index = os.path.join(repo_dir, 'files/index.json')
target_os = argv[1]

with open(index) as f:
    files = json.load(f)

for k in files.keys():
    source = os.path.join(repo_dir, 'files', k)
    backup = os.path.join(os.path.expanduser('~/.dotfiles-backup/files'), k)
    v = files[k]
    if isinstance(v, str):
        target = v
    elif isinstance(v, dict):
        target = v.get(target_os, None)
    else:
        target = None
    target = os.path.expanduser(target)
    if target != None and os.path.isfile(source):
        if os.path.exists(target):
            if os.path.isfile(backup):
                remove(target)
            else:
                print(target, backup)
                rename(target, backup)
        print(source, target)
        symlink(source, target)
