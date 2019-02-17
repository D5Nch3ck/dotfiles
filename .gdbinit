source /home/test/code/peda/peda.py
set disassembly-flavor intel
## Setting default gdb configurations
# stop printing string in the \0
set print null-stop on
# print a array in only one line
set print array off
# doesn't print the array indexes
set print array-index off
# prints the address a pointer refers to
set print address on
# pretty printing for C structs and unions
set print pretty on
set print union on
# don't print python stack trace
set python print-stack none
# enabling script type detection
set script-extension strict
# print inferior events notification
set print inferior-events on
# auto load gdb scripts
set auto-load python-scripts on
set auto-load local-gdbinit on
set auto-load gdb-scripts on
# follow parents when forking
set follow-fork-mode parent
# makes all exec'ed processes to be a new inferior
set follow-exec-mode new
# all forked processes should be controlled by gdb
set detach-on-fork off
set target-async on
set non-stop off
set pagination off
set history expansion off
set history save off
set logging overwrite off
set logging redirect off
set logging off
set extended-prompt  \[\e[0;31m\](gdb) >\[\e[0m\] 
source /home/test/.local/lib/python2.7/site-packages/voltron/entry.py
