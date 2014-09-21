#!/usr/bin/env python
# encoding: utf-8

import logging
import re
import os

from os.path import expanduser


files = []
try:
    with open('README.md', 'r') as f:
        line = f.readline()
        while line:
            file = line.strip().strip('|').split('|')
            file = map(lambda x: x.strip(), file)
            if len(file) == 2:
                files.append(tuple(file))
            line = f.readline()
except IOError, e:
    logging.exception(e)

if not files:
    logging.info('No files to compare')
    exit(1)

files = filter(
    lambda x: True if re.match('(~/|/).*', x[1]) else False,
    files,
)

rel = os.path.dirname(os.path.realpath(__file__))
for cur, local in files:
    cur = rel + '/' + cur
    local = local.replace('~', expanduser('~'))
    os.system('git diff %s %s' % (local, cur))
