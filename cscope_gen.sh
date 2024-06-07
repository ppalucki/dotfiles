#!/bin/sh
# https://stackoverflow.com/questions/934233/cscope-or-ctags-why-choose-one-over-the-other
find . -name '*.py' \
-o -name '*.java' \
-o -iname '*.[CH]' \
-o -name '*.cpp' \
-o -name '*.cc' \
-o -name '*.hpp'  \
> cscope.files

# -b: just build
# -q: create inverted index
cscope -u -b -q -v

date
ls -lrt cscope*
