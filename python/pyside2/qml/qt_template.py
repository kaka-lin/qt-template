#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import sys

mode = ''
# use: python3 mtool.py prod
if len(sys.argv) == 2:
    mode = sys.argv[1]

if hasattr(sys, "frozen"):
    # running in a bundle
    dir_name = os.path.dirname(os.path.abspath(sys.executable))
    mode = 'prod'
else:
    # running live
    dir_name = os.path.dirname(os.path.abspath(__file__))

from PySide2.QtGui import QGuiApplication
from src import main
app = QGuiApplication(sys.argv)
main.run(app, dir_name, mode)
