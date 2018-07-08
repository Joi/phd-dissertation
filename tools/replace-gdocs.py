#!/usr/bin/env python2
# coding: utf-8
#
# find . -iname '*.tex' | xargs -n1 tools/replace-gdocs.py
#

import codecs
import sys

if len(sys.argv) != 2:
    print "Usage: %s [filename]" % sys.argv[0]
    sys.exit(1)

fn = sys.argv[1]
f_contents = codecs.open(fn, "r", "utf-8").read()

for l in codecs.open("tools/gdocs-latex-replacements.txt", "r", "utf-8"):
    before, after = l.strip().split("->", 1)
    f_contents = f_contents.replace(before, after)

with codecs.open(fn, "w", "utf-8") as f:
    f.write(f_contents)
    f.flush()
