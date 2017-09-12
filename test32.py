#!/usr/bin/env python3

import os

for k in sorted(os.environ.keys()):
    print('{}: {}'.format(k, os.environ[k]))

